class OrderInformation < ApplicationRecord
  belongs_to :order_product
  has_many :customers,  dependent: :destroy
  enum payment_method: { credit_card: 0, transfer: 1 }
end
