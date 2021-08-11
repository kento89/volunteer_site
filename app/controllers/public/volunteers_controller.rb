class Public::VolunteersController < ApplicationController
  
  def index
    @volunteer = Volunteer.all
  end
  
  def show
    @volunteer = Volunteer.find(params[:id])
  end
  
end
