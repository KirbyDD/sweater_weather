require 'rails_helper'

RSpec.describe 'User Endpoint' do
  it 'should create a user' do
    user_params = {email: "aang@example.com", password: "test", password_confirmation: "test"}
    post '/api/v1/users', params: user_params
    expect(response).to be_successful
    expect(response.status).to eq(201)
    user = JSON.parse(response.body, symbolize_names: true)
    expect(user[:data][:attributes][:email]).to eq('aang@example.com')
  end

  it 'should not create with a missing field' do
    user_params = {password: "test", password_confirmation: "test"}
    post '/api/v1/users', params: user_params
    expect(response).not_to be_successful
    expect(response.status).to eq(400)
    error = JSON.parse(response.body, symbolize_names: true)
    expect(error[:error]).to eq('All fields are required')
  end

  it 'should not createwith a duplicate email' do
    user = User.create!(email: "aang@example.com", password: "test", password_confirmation: "test")
    user_params = {email: "aang@example.com", password: "test", password_confirmation: "test"}
    post '/api/v1/users', params: user_params
    expect(response).not_to be_successful
    expect(response.status).to eq(400)
    error = JSON.parse(response.body, symbolize_names: true)
    expect(error[:error]).to eq('E-mail Already In Use')
  end

  it 'should not create with a non matching passwords' do
    user_params = {email: "aang@example.com", password: "test", password_confirmation: "tst"}
    post '/api/v1/users', params: user_params
    expect(response).not_to be_successful
    expect(response.status).to eq(400)
    error = JSON.parse(response.body, symbolize_names: true)
    expect(error[:error]).to eq('Password and Confirmation Do Not Match')
  end
end
