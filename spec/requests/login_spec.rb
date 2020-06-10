require 'rails_helper'

RSpec.describe 'Login Route', type: :request do
  it 'should return a user with correct credentials' do
    user = User.create!(email: "aang@example.com", password: "test", password_confirmation: "test")
    login_info = {email: "aang@example.com", password: "test"}
    post '/api/v1/sessions', params: login_info
    expect(response).to be_successful
    expect(response.status).to eq(200)
    user = JSON.parse(response.body, symbolize_names: true)
    expect(user[:data][:attributes][:email]).to eq('aang@example.com')
  end

  it 'should not return a user with incorrect credentials' do
    user = User.create!(email: "aang@example.com", password: "test", password_confirmation: "test")
    login_info = {email: "aang@example.com", password: "tst"}
    post '/api/v1/sessions', params: login_info
    expect(response).not_to be_successful
    expect(response.status).to eq(400)
    message = JSON.parse(response.body, symbolize_names: true)
    expect(message[:error]).to eq('Incorrect Email and/or Password')
  end
end
