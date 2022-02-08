class User < ApplicationRecord
    has_many :book_owners
    has_many :book_borrowers

    validates_presence_of :name, :company_email, :company_id, :phone
end
