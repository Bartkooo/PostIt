class InvitationsController < ApplicationController
  def create
    id1 = params[:ids][:id1]
    id2 = params[:ids][:id2]
    @invitation = Invitation.new(user_id: id1, friend_id: id2)
    @invitation.save
    redirect_to user_path(params[:ids][:id2])
  end

  def destroy
    invitation = Invitation.find(params[:invitation_id])
    invitation.destroy
    redirect_to user_path(invitation.friend_id)
  end

  def update
    invitation = Invitation.find(params[:invitation_id])
    p current_user
    invitation.update(confirmed: true)
    redirect_to user_path(invitation.user_id)
  end
end
