class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(user_id: current_user.id, post_id: comment_params[:post_id], body: comment_params[:body])

    if @comment.save
        redirect_to root_path, notice: "Comment Created!"
    else
        redirect_to root_path, status: :unprocessable_entity
    end

  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to root_path, notice: "Comment deleted"
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end




end
