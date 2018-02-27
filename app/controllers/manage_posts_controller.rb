class ManagePostsController < ApplicationController
  before_action :authenticate_user!
  def index
      @user = current_user
      # html と csv で分ける
      respond_to do |format|
        format.html do
          @user_post = current_user.posts.
                       order('created_at DESC').page params[:page]
        end
        format.csv do
          @user_post_csv = current_user.posts
          send_data render_to_string, filename: "user_posts.csv", type: :csv
        end
      end
  end

  def show
    @user = current_user
    @user_post = @user.posts.find(params[:id])
  end

  def edit
    @user = current_user
    @user_post = current_user.posts.find(params[:id])
  end

  def update
    @user = current_user
    @user_post = Post.find(params[:id])
    if  @user_post.update_attributes(post_params)
      redirect_to user_manage_posts_path, flash: {success: '編集完了'}
    else
      render 'edit'
    end
  end

  def destroy
    user_post = Post.find(params[:id])
    user_post.destroy
    flash[:success] = "記事を削除しました"
    redirect_to user_manage_posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :postimage, :postimage_cache, :status)
    end

end
