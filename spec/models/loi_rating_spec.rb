require 'rails_helper'

RSpec.describe LoiRating, :type => :model do
  context 'Associations' do
    it "has one User" do
      user = FactoryGirl.create(:user)
      loi_rating = FactoryGirl.create(:loi_rating, user: user)
      expect(loi_rating.user).to eq(user)
    end

    it "has one LoiForm" do
      loi_form = FactoryGirl.create(:loi_form)
      loi_rating = FactoryGirl.create(:loi_rating, loi_form: loi_form)
      expect(loi_rating.loi_form).to eq(loi_form)
    end
  end

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

  describe 'average' do
    before :each do
      @loi_rating = FactoryGirl.create(:loi_rating)
    end
    
    it 'returns a float' do
      expect(@loi_rating.average).to be_kind_of(Float)
    end

    it 'returns the average of the four ratings' do
      loi_rating = FactoryGirl.create(:loi_rating, q1_rating: 1, q2_rating: 2, q3_rating: 1, q4_rating: 2)
      expect(loi_rating.average).to eq(1.5)
    end
  end
end
