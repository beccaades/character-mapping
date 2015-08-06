class Experience < ActiveRecord::Base
belongs_to :character
attr_accesible :address, :latitude, :longitude
geocoded_by :address
after_validation :geocode, :if => :address_changed
end
