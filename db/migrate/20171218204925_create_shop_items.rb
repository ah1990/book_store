class CreateShopItems < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_items do |t|
      t.references :book, index: true, foreign_key: { on_delete: :cascade }
      t.references :shop, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
