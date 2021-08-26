class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
    @volunteer_customer = VolunteerCustomer.where(customer_id: current_customer.id)
  end
  
  def index
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(params_customer)
      redirect_to public_customers_path(current_customer)
    else
      render 'edit'
    end
  end

  def destroy
  end
  
  private
  
  def params_customer
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_number,:address,:phone_number,:experience,:comment,:image)
  end

end
