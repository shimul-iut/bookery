class User < ApplicationRecord
    has_many :book_owners
    has_many :book_borrowers
end
