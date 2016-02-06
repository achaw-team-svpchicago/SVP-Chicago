# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    created_at { DateTime.current }
    password { Faker::Lorem.characters(10) }

    factory :admin do
      role "admin"
    end

    factory :super_admin do
      role "super-admin"
    end
  end
end
