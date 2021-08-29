class Public::VolunteerCustomersController < ApplicationController
  
  def create
    @volunteer_customer = VolunteerCustomer.create(volunteer_id: volunteer_customer_params[:volunteer_id], customer_id: volunteer_customer_params[:customer_id])
    Apply.find(volunteer_customer_params[:apply_id]).destroy!
    redirect_to public_volunteer_applies_path(@volunteer_customer.volunteer), notice:"「#{@volunteer_customer.customer.last_name}」が、ボランティア：#{@volunteer_customer.volunteer.name}へ加入しました。"
  end
  
  def destroy
    @volunteer_customer = VolunteerCustomer.find(params[:id])
    @volunteer_customer.destroy!
    @volunteer = Volunteer.find(params[:volunteer_id])
    redirect_to recruiter_volunteer_path(@volunteer), notice: "ボランティア「#{@volunteer.name}」を退会しました。"    
  end

  private

  def volunteer_customer_params
      params.permit(:volunteer_id, :customer_id, :apply_id)
  end
end
