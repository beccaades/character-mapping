class Character < ActiveRecord::Base
  belongs_to :user
  has_one :map
  has_many :moments, through: :maps
  has_many :maps

end
