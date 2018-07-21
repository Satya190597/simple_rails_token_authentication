class User < ApplicationRecord
  has_secure_password
  has_secure_token
  serialize :tokenhash, Hash
end
