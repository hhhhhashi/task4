class Item < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :car_items, dependent: :destroy

end
