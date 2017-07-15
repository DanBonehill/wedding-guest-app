class GuestsController < ApplicationController
  before_action :set_invitation, only: [:create]
  before_action :set_guest, only: [:destroy]

  def new
    @guest = Guest.new
    @invitation = params[:invitation_id]
  end

  def create
    @guest = Guest.new(guest_params)
    @guest.invitation = @invitation
    if @guest.save
      flash[:success] = "Guest Added"
      redirect_to invitations_path
    else
      flash[:danger] = "Guest was not added"
      redirect_to invitations_path
    end
  end

  def destroy
    @guest.destroy
    redirect_to invitation_path
  end

  private

  def guest_params
    params.require(:guest).permit(:name)
  end

  def set_guest
    @guest = Guest.find(params[:id])
  end

  def set_invitation
    @invitation = Invitation.find(params[:invitation_id])
  end
end
