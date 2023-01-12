class Admin::HomesController < ApplicationController
  def top
    @orderinformations = OrderInformation.all.page(params[:page])
    @sum = 0
  end

end
