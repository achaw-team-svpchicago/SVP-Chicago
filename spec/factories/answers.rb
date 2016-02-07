# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    association :loi_form
    question { Faker::Lorem.sentence(3) }
    answer { Faker::Lorem.sentence(5) }
  end
end