class PostsController < ApplicationController
  include ActionView::Helpers::UrlHelper
  before_action :authenticate_user!, only: [:create, :new, :destroy]

  def new
    @user = current_user
    @post = Post.new
    @comment = Comment.new
  end

  def create
    @user = current_user
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
    if user_signed_in?
      @user = current_user
      # user/posts (ログイン状態でマイページからアクセスしたとき)
        if current_page?(user_posts_path)
        @user_post = current_user.posts.find(params[:id])
        render :user_post
      end
    end
      @post = Post.find(params[:id])
      # @post = Post.includes(:user).find(params[:id])
      @comment = Comment.new
  end

  def edit
    @user = current_user
    @post = Post.find(params[:id])
  end

  def update
    @user = current_user
    @post = Post.find(params[:id])
    if  @post.update_attributes(post_params)
      redirect_to user_posts_path, flash: {success: '編集完了'}
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "記事を削除しました"
    redirect_back(fallback_location: root_path)

  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :postimage, :postimage_cache, :status)
    end

end
