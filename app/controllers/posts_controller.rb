class PostsController < ApplicationController
  def index
    #posts from current user and current users friends
    @user = User.find(params[:user_id])
    @friends = @user.friends
    unsorted_posts = []
    @user.posts.map { |post| unsorted_posts << post }
    @friends.each do |friend|
      friend.posts.map { |post| unsorted_posts << post }
    end
    @posts = unsorted_posts.sort_by(&:created_at).reverse
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)
    redirect_back(fallback_location: user_posts_path(@user))
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_back(fallback_location: users_path)
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id, :post_picture)
  end
end
