class Public::RoomsController < ApplicationController
  before_action :authenticate_customer
  befoer_action :set_room_or_move, only: :show
  
  def index
  end
  
  def show
    @message = Message.new
    @message = Message.where(room_id: @room.id)
  end
  
  private
  
    def set_room_or_move
      redirect_to rooms_path, alert: 'チャットルームへ入れませんでした' if Volunteer.find(params[:id]).customer_id != current_customer.id
      
      @room = Room.find_by(volunteer_id: params[:id])
      
      if @room.nil?
        @room = Room.new(volunteer_id: params[:id])
        redirect_to rooms_path, alert: 'チャットルームへ入れませんでした' unless @room.save
      end
      
    end
  
end
