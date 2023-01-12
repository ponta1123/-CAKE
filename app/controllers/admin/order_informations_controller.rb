class Admin::OrderInformationsController < ApplicationController

  def show
    @orderinformation = OrderInformation.find(params[:id])
    @orderinformations = @orderinformation.order_products
  end


end
