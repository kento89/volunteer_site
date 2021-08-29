class Public::VolunteersController < ApplicationController
  before_action :authenticate_customer!
  
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
