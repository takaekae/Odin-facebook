class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @friend_request = Request.find(params[:request_id])
    @friend = Friendship.new(user_id: @friend_request.requesting_friend_id, friend_id: @friend_request.requested_friend_id)
    @friend_inverse = Friendship.new(user_id: @friend_request.requested_friend_id, friend_id: @friend_request.requesting_friend_id)

    if @friend.save & @friend_inverse.save
        @friend_request.destroy
        redirect_to user_path(current_user), notice: "Friend accepted!"
    else
        redirect_to user_path(current_user), status: :unprocessable_entity
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship_inverse = Friendship.find_by(user_id: @friendship.friend_id)

    @friendship.destroy
    @friendship_inverse.destroy
    
    redirect_to user_path(current_user), notice: "Friend deleted."
  end
end
