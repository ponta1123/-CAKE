class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    @sum = 0

  end

  def destroy
   cart_item = CartItem.find(params[:id])
   cart_item.destroy
   redirect_to cart_items_path
  end

  def destroy_all
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    # @cart_item = CartItem.new(cart_item_params)
    # @cart_items = current_customer.cart_items
    # @cart_items.each do |cart_item|
    #   if cart_item.item_id == @cart_item.item_id
    #     new_amount = cart_item.amount + @cart_item.amount
    #     cart_item.update_attribute(:amount, new_amount)
    #     @cart_item.delete
    #   else
    #     @cart_item = CartItem.new(cart_item_params)
    #   end
    # end
    # @cart_item.save
    # redirect_to cart_items_path

    @cart_item = CartItem.find_by(item_id:cart_item_params[:item_id],customer_id:current_customer.id)
    if @cart_item
      #CartItem.exists?(item_id:cart_item_params[:item_id])
       new_amount = cart_item_params[:amount].to_i + @cart_item.amount
       @cart_item.update_attribute(:amount, new_amount)
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  def update
   @cart_item = CartItem.find(params[:id])
   @cart_item.update(cart_item_params)
   redirect_to cart_items_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end
