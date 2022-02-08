class Log < ApplicationRecord

    before_create :slugify
    def slugify
        self.slug = name.parameterize
    end
    validates_presence_of :logtype
end
