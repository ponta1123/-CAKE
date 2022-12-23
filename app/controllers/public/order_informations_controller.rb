class Public::OrderInformationsController < ApplicationController

  def new
    @order = OrderInformation.new
  end

  def confirm
    @order = OrderInformation.find(OrderInformation_params)
    @order.customer_id = current_customer.id

  end




  def create
    @order = OrderInformation.new(OrderInformation_params)

    @order.save

    redirect_to public_addresses_path

  end

  private

  def orderInformation_params
    params.require(:OrderInformation).permit(:address, :postal_code, :name, :order_status, :payment, :billing_amount, :postage)
  end

end
