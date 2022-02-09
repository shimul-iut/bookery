FactoryBot.define do
    factory :genre do
        name { Faker::Book.genre}
        #slug { Faker::Book.genre.parameterize}
        popularity_rating { Faker::Number.decimal(l_digits: 2)}
    end
end