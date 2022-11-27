class OrderProduct < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :order_informations, dependent: :destroy
end
