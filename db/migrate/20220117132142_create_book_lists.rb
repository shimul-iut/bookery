class CreateBookLists < ActiveRecord::Migration[6.0]
  def change
    create_table :book_lists do |t|
      t.string :name
      t.string :slug
      t.string :author
      t.string :unique_id
      t.string :image_url
      t.string :isbn
      t.belongs_to :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
