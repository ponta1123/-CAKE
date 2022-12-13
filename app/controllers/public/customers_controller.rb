class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def index
    @customers = Customer.all
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def update
   @customer = Customer.find(params[:id])
   @customer.update(customer_params)
   redirect_to public_customer_path
  end

   private


  def customer_params
   params.require(:customer).permit(:email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
  end

end
