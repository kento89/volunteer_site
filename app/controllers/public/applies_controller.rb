class Public::AppliesController < ApplicationController
  
  def index
    @applies = Apply.where(volunteer_id: params[:volunteer_id])
  end
  
  def create
    current_customer.applies.create(volunteer_id: apply_params[:volunteer_id])
    flash[:notice] = "加入申請しました"
    redirect_to recruiter_volunteers_path
  end
  
  def destroy
    @apply = Apply.find(params[:id])
    @apply.destroy!
    @volunteer = Volunteer.find(params[:volunteer_id])
    flash[:notice] = "加入申請を取り消しました"
    redirect_to recrutier_volunteer_applies_path(@volunteer)
  end

  private

    def apply_params
      params.permit(:volunteer_id, images: [])
    end

end
