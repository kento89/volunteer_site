class Recruiter::CustomersController < ApplicationController
  def show
  end
  
  def show
    @volunteer = Volunteer.find(params[:id])
    @volunteer_customers = VolunteerCustomer.where(volunteer_id: @volunteer.id)
  end
end
