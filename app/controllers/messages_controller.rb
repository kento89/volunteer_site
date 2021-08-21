class MessagesController < ApplicationController

  def create

    @message = Message.new(message_params)

    if current_customer != nil
      @message.customer = current_customer
    elsif current_recruiter != nil
      @message.recruiter = current_recruiter
    end

    @room=@message.room

    if @message.save

      # @roommembernotme = Message.where(room_id: @room.id).where.not(recruiter_id: current_recruiter.id)  #自分以外の新しいメッセージをルーム内から取得
      # @theid = @roommembernotme.find_by(room_id: @room.id)
      # 新しい通知
      if @message.customer != nil
        notification = Notification.new(visited_id: @message.room.volunteer.recruiter_id, visitor_id: @message.customer_id, room_id: @room.id, message_id: @message.id, checked: false)
        notification.save
      end

      # 自分のメッセージは既読にする
      # if notification.recruiter_id == currente_recruiter.id
      #   notification.checked = true
      # end

      # notification.save if notification.valid?


    end
    redirect_to request.referer

  end

  private

  def message_params
    params.require(:message).permit(:message, :room_id)
  end
end
