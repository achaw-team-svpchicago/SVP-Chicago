# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :loi_form do
    organization "Best Org Eva"
    address "123 S Michigan St. Chicago, IL 60616"
    phone "773-320-1234"
    website "www.bestorgeva.org"
    executive "Da Boss"
    executive_phone "773-123-1234"
    executive_email "daboss@bestorgeva.org"
    contact "Da Contact"
    contact_phone "773-123-1123"
    contact_email "dacontact@bestorgeva.org"
    employees 29
    volunteers 56
    board 21
    budget 300000
    affiliated { Faker::Lorem.words(50) }
    mission { Faker::Lorem.words(50) }
    vision { Faker::Lorem.words(50) }
    concerns { Faker::Lorem.words(50) }
    actual_staff_board 3
    current_staff_board 5
    projected_staff_board 10
    board_challenge_1 { Faker::Lorem.words(20) }
    board_1_priority "high"
    board_challenge_2 { Faker::Lorem.words(20) }
    board_2_priority "medium"
    board_challenge_3 { Faker::Lorem.words(20) }
    board_3_priority "high"
    actual_staff_operations 30
    current_staff_operations 35
    projected_staff_operations 40
    operations_challenge_1 { Faker::Lorem.words(20) }
    operations_1_priority "high"
    operations_challenge_2 { Faker::Lorem.words(20) }
    operations_2_priority "high"
    operations_challenge_3 { Faker::Lorem.words(20) }
    operations_3_priority "medium"
    actual_staff_fund 25
    current_staff_fund 400
    projected_staff_fund 3123
    fund_challenge_1 { Faker::Lorem.words(20) }
    fund_1_priority "high"
    fund_challenge_2 { Faker::Lorem.words(20) }
    fund_2_priority "low"
    fund_challenge_3 { Faker::Lorem.words(20) }
    fund_3_priority "medium"
    actual_staff_marketing 2
    current_staff_marketing 45
    projected_staff_marketing 324
    marketing_challenge_1 { Faker::Lorem.words(20) }
    marketing_1_priority "medium"
    marketing_challenge_2 { Faker::Lorem.words(20) }
    marketing_2_priority "high"
    marketing_challenge_3 { Faker::Lorem.words(20) }
    marketing_3_priority "low"
    actual_staff_strategic 213
    current_staff_strategic 343
    projected_staff_strategic 2345
    strategic_challenge_1 { Faker::Lorem.words(20) }
    strategic_1_priority "medium"
    strategic_challenge_2 { Faker::Lorem.words(20) }
    strategic_2_priority "low"
    strategic_challenge_3 { Faker::Lorem.words(20) }
    strategic_3_priority "high"
    actual_staff_technology 13
    current_staff_technology 345
    projected_staff_technology 1
    technology_challenge_1 { Faker::Lorem.words(20) }
    technology_1_priority "medium"
    technology_challenge_2 { Faker::Lorem.words(20) }
    technology_2_priority "high"
    technology_challenge_3 { Faker::Lorem.words(20) }
    technology_3_priority "high"
    actual_staff_other 0
    current_staff_other 3
    projected_staff_other 5
    other_challenge_1 { Faker::Lorem.words(20) }
    other_1_priority "high"
    other_challenge_2 { Faker::Lorem.words(20) }
    other_2_priority "low"
    other_challenge_3 { Faker::Lorem.words(20) }
    other_3_priority "low"
    additional { Faker::Lorem.words(50) }
    referral { Faker::Lorem.words(50) }
    sectors ["addiction", "food", "homeless"]
    other_sectors { Faker::Lorem.words(8) }
    geo_focus "city"
    other_geo_focus { Faker::Lorem.words(8) }
  end
end
