class ManagePostsController < ApplicationController
  # before_action :set_manage_post, only: [:show, :edit, :update, :destroy]

  # GET /manage_posts
  # GET /manage_posts.json
  def index
      @user = current_user
      @user_post = current_user.posts.order('created_at DESC')
  end

  # GET /manage_posts/1
  # GET /manage_posts/1.json
  def show
    @user = current_user
    # user/posts (ログイン状態でマイページからアクセスしたとき)
    @user_post = current_user.posts.find(params[:id])
  end

  # GET /manage_posts/new
  def new
    @manage_post = ManagePost.new
  end

  # GET /manage_posts/1/edit
  def edit
    @user = current_user
    @user_post = current_user.posts.find(params[:id])
  end

  # POST /manage_posts
  # POST /manage_posts.json
  def create
    @manage_post = ManagePost.new(manage_post_params)

    respond_to do |format|
      if @manage_post.save
        format.html { redirect_to @manage_post, notice: 'Manage post was successfully created.' }
        format.json { render :show, status: :created, location: @manage_post }
      else
        format.html { render :new }
        format.json { render json: @manage_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage_posts/1
  # PATCH/PUT /manage_posts/1.json
  def update
    @user = current_user
    @user_post = Post.find(params[:id])
    if  @user_post.update_attributes(post_params)
      redirect_to user_manage_posts_path, flash: {success: '編集完了'}
    else
      render 'edit'
    end
  end

  # DELETE /manage_posts/1
  # DELETE /manage_posts/1.json
  def destroy
    @manage_post.destroy
    respond_to do |format|
      format.html { redirect_to manage_posts_url, notice: 'Manage post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :postimage, :postimage_cache, :status)
    end

end
