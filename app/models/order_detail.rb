class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: { not_making: 0, waiting_making: 1, making: 2, making_end: 3 }
end
