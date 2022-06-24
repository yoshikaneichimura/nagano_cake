class Admin::CustomersController < ApplicationController
 
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(paramus[:id])

  end

  def edit
    @customer = Customer.find(paramus[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_customers_path

  end

  def destroy
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:encrypted_password,:postal_code,:address,:telephone_number,:is_active)

  end
end
