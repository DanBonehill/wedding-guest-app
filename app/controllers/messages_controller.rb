class MessagesController < ApplicationController
  before_action :set_message, only: [:show]
  before_action :require_user, only: [:index, :show]

  def index
    @messages = Message.all
  end

  def show
    set_read_true
    @invitation = Invitation.find_by(unique_code: @message.unique_code) || nil
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = "Thank you for your message. We'll be in touch shortly."
      redirect_to info_path
    else
      flash.now[:danger] = "Something went wrong"
      render :new
    end
  end

  def new
    @message = Message.new
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :content, :unique_code, :read)
  end

  def set_message
    @message = Message.find(params[:id])
  end

  def set_read_true
    if @message.read != true
      @message.read = true
      @message.save
    end
  end
end
