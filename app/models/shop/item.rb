class Shop::Item < ApplicationRecord
  belongs_to :shop
  belongs_to :book

  state_machine :state, :initial => :created do

    event :to_shop do
      transition [:created] => :in_stock
    end

    event :sell do
      transition [:created] => :sold
    end

  end
end
