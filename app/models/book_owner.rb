class BookOwner < ApplicationRecord
    has_many :book_borrowers
    belongs_to :user
    belongs_to :book_list
end
