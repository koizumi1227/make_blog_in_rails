class HomeController < ApplicationController

  def index
    # 公開済postのみ取得(published)
    @post = Post.all.published.includes(:user).order('created_at DESC')
    # @post = Post.all.order('created_at DESC')
    @user = current_user if user_signed_in?
  end

  def about
    @user = current_user if user_signed_in?
    render 'layouts/about'
  end
end
