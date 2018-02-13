class HomeController < ApplicationController

  def index
    @post = Post.all.includes(:user).order('created_at DESC')
    # @post = Post.all.order('created_at DESC')
    @user = current_user.username if user_signed_in?
  end

  def about
    render 'layouts/about.html'
  end
end
