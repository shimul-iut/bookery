class Genre < ApplicationRecord
    has_many :book_lists

    before_create :slugify
    def slugify
        self.slug = name.parameterize
    end

    validates_presence_of :name
end