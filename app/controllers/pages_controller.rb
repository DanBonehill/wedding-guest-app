class PagesController < ApplicationController

  def index
  end

  def rsvp
  end

  def search
    @invitation = Invitation.find_by(unique_code: params[:q])
    if @invitation
      redirect_to edit_invitation_path(@invitation)
    else
      flash.now[:danger] = "Invalid unique code"
      render :rsvp
    end
  end

  def info
    @location = "ChIJP9tNyoGOekgRQlIq1rsiwbQ"
  end

  private

  def invitation_params
    params.require(:invitation).permit(:unique_code)
  end
end
