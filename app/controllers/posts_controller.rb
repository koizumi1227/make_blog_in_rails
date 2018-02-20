class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :destroy]

  def new
    @post = Post.new
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash.now[:success] = "投稿完了しました！！"
      redirect_to root_path
    else
      flash.now[:danger] = "エラーがあるため投稿できませんでした。"
      @commnet = Comment.new
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    # @post = Post.includes(:user).find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "記事を削除しました"
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :postimage)
    end
end
