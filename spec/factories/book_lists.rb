FactoryBot.define do
    factory :book_list do
      name { Faker::Book.name }
      author { Faker::Book.author }
      unique_id {Faker::Alphanumeric.alphanumeric(number: 10)}
      image_url {Faker::Internet.url}
      isbn {Faker::Alphanumeric.alphanumeric(number:10)}
      genre_id {nil}
      book_owner_id {nil}
    end
  end