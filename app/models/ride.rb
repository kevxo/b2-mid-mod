class Ride < ApplicationRecord
  belongs_to :park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics
end