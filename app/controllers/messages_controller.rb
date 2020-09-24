class MessagesController < ApplicationController
  def index
    @message = current_user.messages.new
    @messages = Message.all
  end

  def save_token
    current_user.token=params[:token]
    redirect_to root_path    
  end

  def create 
    current_user.messages.create!(message_params)
    redirect_to root_path    
  end

  private
  def message_params
    params.require(:message).permit(:message)
  end
end