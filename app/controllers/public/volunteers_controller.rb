class Public::VolunteersController < ApplicationController
  
  def index
    @volunteer = Volunteer.all
  end
  
  def show
    @volunteer = Volunteer.find(params[:id])
    @room = Room.find_by(volunteer_id: params[:id])
  end
  
end
