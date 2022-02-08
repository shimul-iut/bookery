FactoryBot.define do
    factory :genredo
        name { Faker::Lorem.word}
        popularity_rating { Faker.float(2)}
    end
end