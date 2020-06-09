require 'rails_helper'

RSpec.describe "trails route", type: :request do
  it 'should have a count' do
    get '/api/v1/trails?location=denver,co'
    trails = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:trails]
    expect(trails.count).to eq(10)
  end
end
