class Recruiter::CustomersController < ApplicationController
  def show
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
end
