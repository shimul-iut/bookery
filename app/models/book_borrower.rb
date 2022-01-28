class BookBorrower < ApplicationRecord
    belongs_to :user
    belongs_to :book_list
    belongs_to :book_owner
end
