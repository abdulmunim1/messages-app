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
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save
    SendMessageJob.perform_later(@message)
  end

  private
  def message_params
    params.require(:message).permit(:message)
  end
end