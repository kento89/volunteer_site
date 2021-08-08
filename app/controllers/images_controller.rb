class ImagesController < ApplicationController
  def create
    @image=Image.new(image_params)
    @image.current_id=current.id
    @image.save
    redirect_to request.referer
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def image_params
    params.require(:image).permit(:image)
  end
end
