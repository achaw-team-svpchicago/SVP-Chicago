require 'rails_helper'

RSpec.describe LoiFormsController, :type => :controller do

  describe 'GET loi_forms/:id' do
    before :each do
      @loi_form = FactoryGirl.create(:loi_form)
    end

    context 'User is not an SVP partner' do
      it 'redirects to root' do
        get :show, id: @loi_form.id
        expect(response).to redirect_to root_path
      end
    end

    context 'User is an SVP admin' do
      before :each do
        @user = FactoryGirl.create(:admin)
        sign_in @user            #sign_in is a method from Devise::TestHelpers in 'spec/rails_helper'
      end

      it 'renders the show template' do
        get :show, id: 1
        expect(response).to render_template :show
      end
    end

    context 'User is an SVP super-admin' do
      before :each do
        @user = FactoryGirl.create(:super_admin)
        sign_in @user
      end

      it 'renders the show template' do
        get :show, id: @loi_form.id
        expect(response).to render_template :show
      end
    end
  end

  describe 'GET loi_forms' do
    before :each do
      @loi_form = FactoryGirl.create(:loi_form)
    end

    context 'User is not an SVP partner' do
      it 'redirects to root' do
        get :index, id: @loi_form.id
        expect(response).to redirect_to root_path
      end
    end

    context 'User is an SVP admin' do
      before :each do
        @user = FactoryGirl.create(:admin)
        sign_in @user            #sign_in is a method from Devise::TestHelpers in 'spec/rails_helper'
      end

      it 'renders the index template' do
        get :index, id: 1
        expect(response).to render_template :index
      end
    end

    context 'User is an SVP super-admin' do
      before :each do
        @user = FactoryGirl.create(:super_admin)
        sign_in @user
      end

      it 'renders the index template' do
        get :index, id: @loi_form.id
        expect(response).to render_template :index
      end
    end
  end

end
