require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "Associations:" do
    it "Has many LoiRatings" do
      user = FactoryGirl.create(:user)
      loi_rating1 = FactoryGirl.create(:loi_rating, user: user)
      loi_rating2 = FactoryGirl.create(:loi_rating, user: user)
      expect(user.loi_ratings).to include(loi_rating1, loi_rating2)
    end
  end

  describe "Validations:" do
    it "is valid if a first and last name are given" do
      user = FactoryGirl.create(:user, first_name: "Henrietta", last_name: "Markanich")
      expect(user).to be_valid
    end

    it "is invalid without a first or last name" do
      user = FactoryGirl.build(:user, first_name: nil, last_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
      expect(user.errors[:last_name]).to include("can't be blank")
    end
  end

  describe "Methods:" do
    describe "full_name" do
      it "should combine a first and last name into a full_name" do
        user = FactoryGirl.build(:user, first_name: "Alan", last_name: "Favre")
        expect(user.full_name).to eq("Alan Favre")
      end
    end
  end

end