class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @post = Post.new
    @posts = @user.posts.all.order("created_at DESC")
    @comment = Comment.new
  end



end
