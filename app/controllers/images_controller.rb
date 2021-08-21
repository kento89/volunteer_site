class ImagesController < ApplicationController
  
  def new
    @volunteer = Volunteer.new
    @volunteer.build_image
  end
  
  def create
    @volunteer=Volunteer.new(volunteer_params)
    @volunteer.save
    redirect_to root_path
  rescue
    render action: 'new'
  end
  
  def update
    @volunteer.update!(volunteer_params)
    redirect_to root_path
  end
  
  def destroy
  end
  
  private
  
  def find_volunteer
    @volunteer=Volunteer.find(params[:id])
  end
  
  def volunteer_params
    params.require(:volunteer).permit(:name, :a_litle_explanation, :explanation, :place, :time, :people, :merit, :necessary_item, :important_point, :comment, :limit, :genre, image_attributes: [:id, :image])
  end
end
