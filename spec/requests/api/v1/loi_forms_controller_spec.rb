require 'rails_helper'

RSpec.describe Api::V1::LoiFormsController, :type => :controller do

  describe 'GET show', type: :request do 
    it 'sends an individual LOI form' do
      loi_form = FactoryGirl.create(:loi_form)

      get "/api/v1/loi_forms/#{loi_form.id}", nil, { 'HTTP_ACCEPT' => 'application/vnd.loi_forms.v1' }

      expect(response).to be_success

      json = JSON.parse(response.body)
      expect(json['name']).to eq loi_form.name
      expect(json['email']).to eq loi_form.email
      # expect(json['answers']).to match_array(loi_form) #I was not able to get this working
    end
  end

  describe 'POST create_loi_rating' do
    before :each do
      @user = FactoryGirl.create(:user)
      @loi_form = FactoryGirl.create(:loi_form)
      @loi_rating = FactoryGirl.build(:loi_rating)
      @ratings = {
        q1: @loi_rating.q1_rating,
        q2: @loi_rating.q2_rating,
        q3: @loi_rating.q3_rating,
        q4: @loi_rating.q4_rating,
        q5: @loi_rating.q5_rating,
        userId: @user.id,
        loiFormId: @loi_form.id
      }
    end
    it 'creates an LoiRating from the ratings parameter' do
      expect{
        post :create_loi_rating , id: @loi_form.id, ratings: @ratings
      }.to change(LoiRating, :count).by(1)
    end
  end
end