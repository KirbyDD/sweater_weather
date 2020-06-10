require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of :email}
  end

  describe 'attributes' do
    it 'should have attribues' do
      user = User.create!(email: "aang@example.com", password: "test", password_confirmation: "test")
      expect(user.email).to eq("aang@example.com")
      expect(user.api_key).to eq(nil)
    end
  end

  describe 'methods' do
    it 'create_api_key' do
      user = User.create!(email: "korra@example.com", password: "test", password_confirmation: "test")
      user.create_api_key
      user.reload
      expect(user.api_key).not_to eq(nil)
    end
  end
end
