class User < ApplicationRecord
  #Validations
  validates :email, uniqueness: true, presence: true
  has_secure_password
  has_secure_token
  serialize :tokenhash, Hash
end
