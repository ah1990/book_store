Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :mobile do
      namespace :v1 do
        get 'shops', to: 'shops#index'
        put 'shops/:shop_id/book/:book_id/mark_as_sold', to: 'shops#mark_as_sold'
      end
    end
  end
end
