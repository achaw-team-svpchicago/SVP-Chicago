require 'rails_helper'

RSpec.describe NonprofitsController, :type => :controller do

  describe "GET home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET loi_form" do
    it "returns http success" do
      get :loi_form
      expect(response).to have_http_status(:success)
    end
  end

end
