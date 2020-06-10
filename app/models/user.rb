class User < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email

  has_secure_password

  def create_api_key
    self.api_key = SecureRandom.urlsafe_base64
    self.save
  end
end
