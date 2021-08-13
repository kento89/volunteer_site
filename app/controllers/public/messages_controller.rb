class Public::MessagesController < ApplicationController
  # before_action :authenticate_customer!

  # def create
  #   @message = current_customer.messages.new(message_params)
  #   if @message.save
  #     redirect_to request.referer
  #   else
  #     render request.referer
  #   end
  # end

  # private

  # def message_params
  #   params.require(:message).permit(:message, :room_id)
  # end
end
