class VolunteerCustomersController < ApplicationController
  def index
    customer = VolunteerCustomer.find_by(customer_id: current_customer.id)
    @volunteers = Volunteer.all
  end
end
