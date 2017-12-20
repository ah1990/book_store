class Shop::Item < ApplicationRecord
  belongs_to :shop
  belongs_to :book

  state_machine :state, :initial => :in_stock do

    event :mark_as_sold do
      transition [:created, :in_stock] => :sold
    end

  end
end
