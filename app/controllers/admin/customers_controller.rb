class Admin::CustomersController < ApplicationController

  def index
   @customers = Customer.new

  end

end
