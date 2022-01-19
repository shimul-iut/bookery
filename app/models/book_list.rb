class BookList < ApplicationRecord
  belongs_to :genre

  before_create :slugify
    def slugify
        self.slug = name.parameterize
    end
end
