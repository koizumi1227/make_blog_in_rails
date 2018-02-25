class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    if @comment.valid?
      flash[:success] = "コメント完了"
      redirect_to post_path(@post)
    else
     flash[:danger] = "内容にエラーがあります"
     # @post = Post.find(params[:post_id])
     @comment = Comment.new
     render 'posts/show'
    end
  end

  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.build(comment_params)
  #   if @comment.save
  #       flash.now[:success] = "コメント完了"
  #       redirect_to post_path(@post)
  #   else
  #     flash.now[:danger] = "内容にエラーがあります"
  #     # @post = Post.find(params[:post_id])
  #     render 'posts/show'
  #   end
  # end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "コメント削除完了"
    redirect_to post_path(@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :comment)
    end
end
