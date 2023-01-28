class RequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friend_request = Request.new(requesting_friend_id: current_user.id, requested_friend_id: params[:invitee])

    if @friend_request.save
        redirect_to user_path(current_user), notice: "Friend request sent!"
    else
        redirect_to user_path(current_user), status: :unprocessable_entity
    end
  end

  def destroy
    @friend_request = Request.find(params[:id])
    @friend_request.destroy
    
    redirect_to user_path(current_user), notice: "Friend request deleted."
  end

  private

end
