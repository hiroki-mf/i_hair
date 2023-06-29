class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
   if  @customer.update(customer_params)
    redirect_to admin_customer_path
   else
    render :edit
   end
  end
  
  def withdrawal
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    redirect_to admin_customers_path
  end

  def show
    @customer = Customer.find(params[:id])
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :birthday, :sex, :email)
  end
  
end
