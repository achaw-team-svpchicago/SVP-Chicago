require 'rails_helper'

RSpec.describe LoiRating, :type => :model do
  it "is valid when q1 through q4 are integers between 1 and 5, and q5 is either 'Yes', 'Maybe' or 'No'" do
    loi_rating = FactoryGirl.create(:loi_rating)
    expect(loi_rating).to be_valid
  end

  it 'is invalid when q1, q2, q3, or q4 is not between 1 and 5' do
    loi_rating1 = FactoryGirl.build(:loi_rating, q1_rating: 0)
    loi_rating2 = FactoryGirl.build(:loi_rating, q2_rating: 987)
    loi_rating3 = FactoryGirl.build(:loi_rating, q3_rating: -3)
    loi_rating4 = FactoryGirl.build(:loi_rating, q4_rating: 6)
    expect(loi_rating1).to_not be_valid
    expect(loi_rating2).to_not be_valid
    expect(loi_rating3).to_not be_valid
    expect(loi_rating4).to_not be_valid
  end

  it "is invalid if q5 is anything other than 'Yes', 'Maybe' or 'No'" do
    loi_rating = FactoryGirl.build(:loi_rating, q5_rating: "Ham Sandwich")
    expect(loi_rating).to_not be_valid
  end
end
