class OrderInformation < ApplicationRecord
  belongs_to :order_product
  has_many :customers,  dependent: :destroy
end
