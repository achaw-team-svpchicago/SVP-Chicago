# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :loi_form do
    name { Faker::Company.name }
    email { Faker::Internet.email}

    after (:build) do |loi_form|
      loi_form.answers << FactoryGirl.build(:answer, loi_form: loi_form)
    end
  end
end
