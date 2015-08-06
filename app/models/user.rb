class User < ActiveRecord::Base
  has_many :characters
  has_many :maps, through: :characters
  has_many :experiences, through: :maps

  has_secure_password
end
