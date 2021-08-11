class Recruiter::MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    if message.save
      redirect_to recruiter_room_path(message.room.volunteer_id)
    else
      redirect_to recruiter_room_path(message.room.volunteer_id), alert: 'メッセージを送信できませんでした'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:message, :room_id).merge(recruiter_id: current_recruiter.id)
  end
end
