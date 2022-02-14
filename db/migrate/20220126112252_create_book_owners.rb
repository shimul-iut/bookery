class CreateBookOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :book_owners do |t|
      t.belongs_to :user, index: true, foregin_key: true
      t.boolean :is_active, default: true
      t.boolean :is_borrowed, default: false

      t.timestamps
    end
  end
end
