class Api::Mobile::V1::ShopsController < Api::Mobile::V1::ApplicationController

  def index
    @shops = Shop.all
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
  
end
