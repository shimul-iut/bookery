class BookList < ApplicationRecord
  belongs_to :genre
  has_one :book_owner
  has_many :book_borrowers

  before_create :slugify
    def slugify
        self.slug = name.parameterize
    end
end
