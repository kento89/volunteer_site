class Recruiter::CustomersController < ApplicationController
  before_action :authenticate_recruiter!
  
  def show
    @customer = Customer.find(params[:id])
  end
end
