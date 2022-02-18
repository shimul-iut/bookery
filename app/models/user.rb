class User < ApplicationRecord
    has_secure_password

    has_one :book_owner
    has_many :book_borrowers

    validates_presence_of :name, :password_digest, :company_email, :company_id, :phone
end
