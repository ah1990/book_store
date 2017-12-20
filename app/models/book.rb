class Book < ApplicationRecord
  has_many :shop_items, :class_name => 'Shop::Item'
  belongs_to :publisher
end
