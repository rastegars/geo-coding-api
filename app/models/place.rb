class Place < ApplicationRecord
  validates :name, :latitude, :longitude, presence: true
end
