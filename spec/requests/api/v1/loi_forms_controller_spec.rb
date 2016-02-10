require 'rails_helper'

describe 'LoiForms API', type: :request do 
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