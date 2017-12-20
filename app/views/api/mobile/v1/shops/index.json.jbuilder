json.shops do
  json.array! @shops do |shop|
    json.id shop.id
    json.name shop.name
    json.books_sold_count shop.shop_items.with_state(:sold).count

    json.books_in_stock do
      # json.array! shop.shop_items.with_state(:in_stock).joins(:book).order("books.id") do |el|
        t = shop.shop_items.with_state(:in_stock).joins(:book).group("books.id", "books.title").order("books.id").count

        t.to_a.flatten.each_slice(3).to_a.map do |el|
          {
              "id": el[0],
              "title": el[1],
              "copies_in_stock": el[2]
          }
        end
      #  json.id el.book.id
      #  json.name el.book.title
      #end
    end
  end
end