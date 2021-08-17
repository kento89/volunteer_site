class RoomsController < ApplicationController
  before_action :same_room_customer!, only: :show

  # def index
  #   my_rooms_ids = current_customer.customer_rooms.selct(:room_id)
  #   @customer = UserRoom.includes(:messages, :customer).where(room_id: my_rooms_ids).where.not(customer_id: current_customer.id).reverse_order
  # end

  def create
    volunteer_room = Room.find(params[:id])
    if volunteer_room.nil?
      room = Room.find_by(volunteer_id: params[:id])
      @room = room.create
    else
      redirect_to room_path(room.id)
    end
  end

  def show
    # Roomの検索(idで)を行う。
    @room = Room.find(params[:id])
    # Messsage.where(room_id: @room.id)でメッセージを取得。
    # Message.newで@messageのインスタンスを作成してformに値を渡す。
    # @room.check_chats_notification(current_recruiter)
    @message = Message.new
    @messages = Message.where(room_id: @room.id)
    @volunteer = @room.volunteer
  end

  private

  def same_room_customer!
    if current_customer != nil && current_recruiter != nil
      redirect_to root_path
      return false
    end
    return true
  end

end

