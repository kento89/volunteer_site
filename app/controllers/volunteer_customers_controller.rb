class VolunteerCustomersController < ApplicationController
  before_action :authenticate_customer!

  def index
    volunteer_customer_ids = VolunteerCustomer.where(customer_id: current_customer.id).pluck('volunteer_id') #修正
    @volunteers = Volunteer.where(id: volunteer_customer_ids)
    @applis = Apply.where(customer_id: current_customer.id)
  end
end
