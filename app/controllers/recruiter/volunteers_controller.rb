class Recruiter::VolunteersController < ApplicationController

  def new
    @volunteer=Volunteer.new
    @image=Image.new
    @images=Image.all
  end

  def create
    
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
