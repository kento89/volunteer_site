class VolunteerCustomersController < ApplicationController
  def index
    volunteer_customer_ids = VolunteerCustomer.where(customer_id: current_customer.id).pluck('volunteer_id') #修正
    @volunteers = Volunteer.where(id: volunteer_customer_ids)
  end
end
