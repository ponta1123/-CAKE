class OrderProduct < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :order_information
end
