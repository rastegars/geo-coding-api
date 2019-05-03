class Place < ApplicationRecord
  validates :location, :lat, :lon, presence: true
end
