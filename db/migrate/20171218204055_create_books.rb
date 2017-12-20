class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.references :publisher, index: true, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
