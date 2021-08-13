class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    if current_customer != nil
      @message.customer = current_customer
    elsif current_recruiter != nil
      @message.recruiter = current_recruiter
    end
    if @message.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  private

  def message_params
    params.require(:message).permit(:message, :room_id)
  end
end
