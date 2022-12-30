class OrderProduct < ApplicationRecord
  belongs_to :item
  belongs_to :order_information
end
