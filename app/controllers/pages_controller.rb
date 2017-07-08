class PagesController < ApplicationController

  def index

  end

  def rsvp

  end

  def search
    @guest = Guest.find_by(unique_code: params[:q])
    if @guest
      redirect_to edit_guest_path(@guest)
    else
      flash[:danger] = "Invalid unique code"
      render :rsvp
    end
  end

  private

  def guest_params
    params.require(:guest).permit(:unique_code)
  end
end
