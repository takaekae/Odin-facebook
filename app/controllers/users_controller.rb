class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unsorted_posts = @user.posts
    @posts = unsorted_posts.sort_by(&:created_at).reverse
  end
end
