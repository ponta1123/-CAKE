class Public::OrderInformationsController < ApplicationController

  def new
    @orderinformation = OrderInformation.new
  end

  def confirm
    @orderinformation = OrderInformation.new(orderinformation_params)
    @orderinformation.customer_id = current_customer.id
    if params[:order_information][:address_method] == "0"
      @orderinformation.address = current_customer.address
      @orderinformation.postal_code = current_customer.postal_code
      @orderinformation.name = current_customer.last_name + current_customer.first_name
    elsif params[:order_information][:address_method] == "1"
      addresses = Address.find(params[:order_information][:address_id])
      @orderinformation.address = addresses.address
      @orderinformation.postal_code = addresses.postal_code
      @orderinformation.name = addresses.name
    elsif params[:order_information][:address_method] == "2"
      @orderinformation.address = params[:order_information][:address]
      @orderinformation.postal_code = params[:order_information][:postal_code]
      @orderinformation.name = params[:order_information][:name]
    end
    @cart_items = current_customer.cart_items
    @orderinformation.billing_amount = 0
    @orderinformation.postage = 800
  end

  def create
    @orderinformation = OrderInformation.new(orderinformation_params)
    @orderinformation.customer_id = current_customer.id
    @orderinformation.save
    current_customer.cart_items.each do |cart_item|
      @orderproduct = OrderProduct.new
      @orderproduct.order_information_id = @orderinformation.id
      @orderproduct.item_id = cart_item.item_id
      @orderproduct.amount = cart_item.amount
      @orderproduct.purchase_price = cart_item.item.with_tax_price
      @orderproduct.save
    end
    current_customer.cart_items.destroy_all
    redirect_to order_informations_completion_path
  end

  def completion
  end


  private

  def orderinformation_params
    params.require(:order_information).permit(:address, :postal_code, :name, :payment, :billing_amount, :postage)
  end
end
