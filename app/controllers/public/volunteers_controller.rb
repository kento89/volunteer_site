class Public::VolunteersController < ApplicationController
  
  def index
    @volunteer = Volunteer.all
  end
  
  def show
    @volunteer = Volunteer.find(params[:id])
    @room = @volunteer.get_room
    @message = Message.new
    @messages = Message.where(room_id: @room.id)
  end
  
  
end
