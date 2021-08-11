class Recruiter::RoomsController < ApplicationController
  before_action :set_room, only: :show

  def index
  end

  def show
    @message = Message.new
    @messages = Message.where(room_id: @room.id)
  end

  private
  def set_room
    @room = Room.find_by(volunteer_id: params[:id])
    
    if @room.nil?
      @room = Room.new(volunteer_id: params[:id])
      redirect_to rooms_path, alert: 'チャットルームに入れませんでした' unless @room.save
    end
  end
end
