class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    @comment = Comment.new
    @posts = Post.where(user_id: current_user).or(Post.where(user_id: current_user.friends)).order("created_at DESC")
  end

  def new
    #new handles image posts - simple text posts are done from index or profile
  end

  def create
    #creates an image post
    if post_params[:post_type] == "image"
      if post_params[:img_url].present?
        @image_post = ImagePost.new(img_url: post_params[:img_url])
      else
        @image_post = ImagePost.new(image: post_params[:image])
      end
      @post = @image_post.build_post(
        title: post_params[:title],
        user_id: current_user.id,
      )
      if @post.save && @image_post.save
        redirect_to root_path, notice: "Image posted sucessfully!"
      else
        render root_path, alert: :unprocessable_entity
      end
    #creates a text post
    else
      @text_post = TextPost.new(body: post_params[:body])
      @post = @text_post.build_post(
        title: post_params[:title],
        user_id: current_user.id,
      )

      if @post.save && @text_post.save
        redirect_to root_path, notice: "Post created sucessfully!"
      else
        render root_path, alert: :unprocessable_entity
      end
    end  
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :img_url, :image, :post_type)
  end

end
