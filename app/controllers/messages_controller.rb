class MessagesController < ApplicationController

  def create

    @message = Message.new(message_params)
    
    if current_customer != nil
      @message.customer = current_customer
    elsif current_recruiter != nil
      @message.recruiter = current_recruiter
    end
    @room=@message.room
    @volunteer=@room.volunteer

    if @message.save
      # 新しい通知
      if @message.customer != nil
        notification = Notification.new(visited_id: @message.room.volunteer.recruiter_id, visitor_id: @message.customer_id, room_id: @room.id, message_id: @message.id, checked: false)
        notification.save
      end

    end
    @messages = @room.messages
    render "recruiter/volunteers/create"

  end

  private

  def message_params
    params.require(:message).permit(:message, :room_id)
  end
end
