require 'rails_helper'

RSpec.describe AdminPanelController, :type => :controller do
  describe "Authentication:" do
    context "guest" do
      describe "GET show" do
        it "redirects to the sign in page" do
          get :show
          expect(response).to redirect_to '/users/sign_in'
        end
      end
    end

    context "admin" do
      before :each do
        sign_in FactoryGirl.create(:user)
      end

      describe "GET show" do
        it "redirects to the root directory" do
          get :show
          expect(response).to redirect_to root_url
        end
      end        
    end

    context "super admin" do
      before :each do
        sign_in FactoryGirl.create(:super_admin)
      end

      describe "GET show" do
        it "renders the show template" do
          get :show
          expect(response).to render_template(:show)
        end
      end
    end
  end
end
