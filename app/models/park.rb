class Park < ApplicationRecord
  has_many :rides

  def ride_average_rating
    self.rides.average(:rating)
  end
end