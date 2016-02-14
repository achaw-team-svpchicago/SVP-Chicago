require 'rails_helper'

RSpec.describe Answer, :type => :model do
  describe 'rated_by?' do
    before :each do
      @user = FactoryGirl.create(:user)
      @loi_form = FactoryGirl.create(:loi_form)
    end
    it 'returns true if the user passed has submitted a rating' do
      loi_rating = FactoryGirl.create(:loi_rating, loi_form: @loi_form, user: @user)
      expect(@loi_form.rated_by?(@user)).to eq(true)
    end

    it 'returns false if the user passed has not submitted a rating' do
      expect(@loi_form.rated_by?(@user)).to eq(false)   
    end
  end
end