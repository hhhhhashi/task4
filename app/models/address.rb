class Address < ApplicationRecord
  belongs_to :customer

  def display_address
    "〒" + postal_code + " " + address + " " + name
  end
end
