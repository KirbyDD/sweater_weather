require 'rails_helper'

RSpec.describe 'Road Trip Route' do
  it 'should return travel time' do
    user = User.create!(email: "aang@example.com", password: "test", password_confirmation: "test", api_key: "aaabbb")
    trip_params = { origin: "Denver,CO", destination: "Pueblo,CO", api_key: "aaabbb"}
    post '/api/v1/road_trip', params: trip_params
    expect(response).to be_successful
    expect(response.status).to eq(201)
    info = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    expect(info[:origin]).to eq("Denver, CO, USA")
    expect(info[:destination]).to eq("Pueblo, CO, USA")
    expect(info[:travel_time]).to eq("1 hour 48 mins")
  end

  it 'should return error for no API key' do
    user = User.create!(email: "aang@example.com", password: "test", password_confirmation: "test", api_key: "aaabbb")
    trip_params = { origin: "Denver,CO", destination: "Pueblo,CO"}
    post '/api/v1/road_trip', params: trip_params
    expect(response).not_to be_successful
    expect(response.status).to eq(401)
    error = JSON.parse(response.body, symbolize_names: true)
    expect(error[:error]).to eq("Valid API Key Required")
  end
end
