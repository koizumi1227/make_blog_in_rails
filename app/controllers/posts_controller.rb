class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      flash.now[:danger] = "エラーがあるため投稿できませんでした。"
      render 'posts/new'
    end
  end

  def show
    @post = Post.find(params[:id])
    # @post = Post.includes(:user).find(params[:id])
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
