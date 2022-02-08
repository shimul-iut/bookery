class CreateBookBorrowers < ActiveRecord::Migration[6.0]
  def change
    create_table :book_borrowers do |t|
    
      t.belongs_to :user, index: true, foregin_key: true
      t.belongs_to :book_list, index: true, foregin_key: true
      t.belongs_to :book_owner, index: true, foregin_key: true

      t.integer :borrow_for_days
      t.string :has_returned, :boolean, default: false
      t.integer :extended_days, default: 0

      t.timestamps
    end
  end
end
