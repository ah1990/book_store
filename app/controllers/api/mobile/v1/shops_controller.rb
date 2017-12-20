class Api::Mobile::V1::ShopsController < Api::Mobile::V1::ApplicationController

  helper_method :count_available_books_in_store

  def index
    @publisher_id = params[:id]
    @shops = Shop.joins(shop_items: {book: :publisher}).where("publishers.id = ?", @publisher_id).distinct
  end

  def mark_as_sold
    shop = Shop.find(shop_id)
    if shop.present?
      books = shop.shop_items.joins(:book).where('books.id = ?', book_id).with_state(:in_stock)
    else
      render json: { error: "No shop with id #{shop_id}" }
    end

    if books.present?
      if books.count >= count
        books = books.take(count)
        books.each do |book|
          book.mark_as_sold
        end
        render json: { state: true }

      else
        render json: {
            error: 'There are not enough books'
        }
      end
    else
      render json: { error: "No books with id #{book_id}" }
    end
  end

  private

  def shop_id
    params[:shop_id].to_i
  end

  def book_id
    params[:book_id].to_i
  end

  def count
    params[:books_count].to_i
  end

  def count_available_books_in_store(shop)
    books = shop.shop_items.with_state(:in_stock).joins(:book, book: :publisher).where("publishers.id = ?", @publisher_id).group("books.id", "books.title").order("books.id").count

    books = books.to_a.flatten.each_slice(3).to_a.map do |el|
      {
          "id": el[0],
          "title": el[1],
          "copies_in_stock": el[2]
      }
    end
    books
  end
  
end
