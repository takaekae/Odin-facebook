class InvitationsController < ApplicationController
  def new
    user = current_user
    new_friend = User.find(params[:user_id])
    user.send_invitation(new_friend)
    flash.alert = 'Friend request sent'
    new_friend.send_notification("Friend request recieved from #{user.username}!")
    redirect_back(fallback_location: users_path)
  end

  def edit
    user = User.find(params[:user_id])
    invitation = Invitation.find(params[:id])
    invitation.update(confirmed: true)
    flash.alert = 'Friend request Accepted'
    sender = User.find(invitation.user_id)
    sender.send_notification("#{user.username} accepted your friend")
    redirect_back(fallback_location: users_path)
  end

  def destroy
    user = User.find(params[:user_id])
    invitation = Invitation.find(params[:id])
    invitation.destroy
    redirect_back(fallback_location: users_path)
  end
end
