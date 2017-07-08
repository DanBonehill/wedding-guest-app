class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  def index
    @guests = Guest.all
    @attending = Guest.attending
    @not_attending = Guest.not_attending
    @awaiting = Guest.awaiting
  end

  def show
  end

  def new
    @guest = Guest.new
  end

  def edit
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      redirect_to guests_path
    else
      render :new
    end
  end

  def update
    if @guest.update(guest_params)
      redirect_to root_path
    else
      flash[:alert] = "Something went wrong"
      render :edit
    end
  end

  def destroy
    @guest.destroy
    redirect_to guests_path
  end

  private

  def guest_params
    params.require(:guest).permit(:name, :rsvp, :unique_code)
  end

  def set_guest
    @guest = Guest.find(params[:id])
  end
end
