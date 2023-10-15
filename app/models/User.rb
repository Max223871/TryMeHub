class User < ApplicationRecord
  has_secure_password

  validates :username, :email, :password_digest, :gender, :country, presence: true
  validates :terms_and_conditions, acceptance: true
end
