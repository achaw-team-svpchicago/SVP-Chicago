# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :loi_rating do
    user_id 1
    loi_form_id ""
    q1_rating 1
    q2_rating 1
    q3_rating 1
    q4_rating 1
    q5_rating "MyString"
  end
end
