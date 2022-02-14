class BookOwner < ApplicationRecord
    has_many :book_borrowers
    has_many :book_lists
    belongs_to :user
end
