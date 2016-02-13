# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :loi_rating do
    association :loi_form
    association :user
    q1_rating 1
    q2_rating 1
    q3_rating 1
    q4_rating 5
    q5_rating "Maybe"
  end
end
