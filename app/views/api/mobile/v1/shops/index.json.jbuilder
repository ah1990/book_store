json.shops do
  json.array! @shops do |shop|
    json.id shop.id
    json.name shop.name
    json.books_sold_count shop.shop_items.with_state(:sold).count
    json.books_in_stock count_available_books_in_store(shop)
  end
end