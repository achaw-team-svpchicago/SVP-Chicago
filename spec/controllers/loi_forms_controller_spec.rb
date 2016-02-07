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

      it 'does not assign the requested loi_form to @loi_form' do
        get :show, id: @loi_form.id
        expect(assigns(:loi_form)).to_not eq @loi_form
      end
    end

    context 'User is an SVP admin' do
      before :each do
        @user = FactoryGirl.create(:admin)
        sign_in @user            #sign_in is a method from Devise::TestHelpers in 'spec/rails_helper'
      end

      it 'renders the show template' do
        get :show, id: @loi_form.id
        expect(response).to render_template :show
      end

      it 'assigns the requested loi_form to @loi_form' do
        get :show, id: @loi_form.id
        expect(assigns(:loi_form)).to eq @loi_form
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

      it 'assigns the requested loi_form to @loi_form' do
        get :show, id: @loi_form.id
        expect(assigns(:loi_form)).to eq @loi_form
      end 
    end
  end

  describe 'GET loi_forms' do
    before :each do
      form1 = FactoryGirl.create(:loi_form)
      form2 = FactoryGirl.create(:loi_form)
      @loi_forms = [form1, form2]
    end

    context 'User is not an SVP partner' do
      it 'redirects to root' do
        get :index
        expect(response).to redirect_to root_path
      end

      it 'does not populate an array of all loi_forms' do
        get :index
        expect(assigns(:loi_forms)).to_not match_array @loi_forms
      end
    end

    context 'User is an SVP admin' do
      before :each do
        @user = FactoryGirl.create(:admin)
        sign_in @user
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template :index
      end

      it 'populates an array of all loi_forms' do
        get :index
        expect(assigns(:loi_forms)).to match_array @loi_forms
      end
    end

    context 'User is an SVP super_admin' do
      before :each do
        @user = FactoryGirl.create(:super_admin)
        sign_in @user
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template :index
      end

      it 'populates an array of all loi_forms' do
        get :index
        expect(assigns(:loi_forms)).to match_array @loi_forms
      end
    end
  end

end
