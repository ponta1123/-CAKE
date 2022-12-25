class OrderInformation < ApplicationRecord
  has_many :order_products, dependent: :destroy
  has_many :customers,  dependent: :destroy
  enum payment: { credit_card: 0, transfer: 1 }
  def subtotal
   item.with_tax_price*amount
  end

end
