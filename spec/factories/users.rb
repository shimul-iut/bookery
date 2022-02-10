FactoryBot.define do
    factory :user do
       name {Faker::Name}
       company_email {Faker::Internet.email}
       company_id {Faker::Number.number(digits: 3)}
       company_role {Faker::Construction.role}
       phone {Faker::PhoneNumber.cell_phone}
    end
end