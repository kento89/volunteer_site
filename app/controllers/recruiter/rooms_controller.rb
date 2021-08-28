class Recruiter::RoomsController < ApplicationController
  before_action :authenticate_recruiter!
  before_action :same_room_recruiter!, only: :show
  
  def index
    my_rooms_ids = current_recruiter.volunteer.user_rooms.selct(:room_id)
    @recruiter = UserRoom.includes(:messages, :recruiter).where(room_id: my_rooms_ids).where.not(recruiter_id: current_recruiter.id).reverse_order
  end
  
  def create
    user_rooms = UserRoom.find_recruiter_rooms(current_recruiter, @recruiter)
    if recruiter_rooms.nil?
      room = Room.create
      UserRoom.create(recruiter_id: current_recruiter.id, room_id: room.id)
      UserRoom.create(customer_id: customer_id, room_id: room.id)
    else
      room = user_rooms.room
    end
    redirect_to room_path(room.id)
  end
  
  def show
    room.check_chats_notification(current_recruiter)
    recruiter_id = room.user_rooms.where.not(recruiter_id: current_recruiter.id).select(:recruiter_id)
    @recruiter = Recruiter.where(id: recruiter_id).first
    @messages = room.messages.includes(:recruiter)
    @message = Message.new(room_id: room.id)
  end
  
  private
  
  def same_room_recruiter!
    return if Room.find(params[:id]).recruiter.include?(current_recruiter)

    flash[:danger] = 'ユーザーにはアクセスする権限がありません'
    redirect_to root_path
  end
end
