# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email { Faker::Internet.email }
    created_at { DateTime.current }
    password { Faker::Lorem.characters(10) }

    factory :admin do
       admin true
    end

    factory :super_admin do
      super_admin true
    end
  end
end
