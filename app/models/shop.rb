class Shop < ApplicationRecord
  has_many :shop_items, :class_name => 'Shop::Item'
end
