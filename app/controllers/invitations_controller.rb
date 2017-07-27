class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:edit, :update]

  def index
    @invitations = Invitation.all
    @invitations = Invitation.attending if params[:attending]
    @invitations = Invitation.not_attending if params[:not_attending]
    @invitations = Invitation.awaiting if params[:awaiting]
  end

  def show
  end

  def edit
  end

  def create
    @invitation = Invitation.create
    if @invitation.save
      flash[:success] = "New Invitation created."
      redirect_to new_invitation_guest_path(@invitation)
    else
      flash[:danger] = "Didn't work"
      redirect_to invitations_path
    end
  end

  def update
    if @invitation.update(invitation_params)
      redirect_to info_path
      InvitationMailer.invitation_updated(@invitation).deliver_now
    else
      flash.now[:alert] = "Something went wrong"
      render :edit
    end
  end

  def destroy
    @invitation.destroy
    redirect_to invitations_path
  end

  private

  def invitation_params
    params.require(:invitation).permit(:rsvp, :unique_code, :email, :comments)
  end

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end
end
