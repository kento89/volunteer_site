class Recruiter::VolunteersController < ApplicationController

  def new
    @volunteer=Volunteer.new
    @image=Image.new
    @images=Image.all
  end

  def create
    volunteer=Volunteer.new(volunteer_params)
    if volunteer.save
      redirect_to root_path
    else
      render 'new'
    end
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
  
  private
  def volunteer_params
    params.require(:volunteer).permit(:name, :a_litle_explanation, :explanation, :place, :time, :people, :merit, :necessary_item, :important_point, :comment, :limit, :genre)
  end

end
