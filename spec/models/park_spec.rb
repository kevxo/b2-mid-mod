require 'rails_helper'

RSpec.describe Park, type: :model do
  describe 'relationships' do
    it {should have_many :rides }
  end

  describe 'instance methods' do
    it 'ride_average_rating' do
      park = Park.create!(name: 'Hershey Park', price: 50.00)
      ride1 = park.rides.create!(name: 'Lightning Racer', rating: 7)
      ride2 = park.rides.create!(name: 'Storm Runner', rating: 7)
      ride3 = park.rides.create!(name: 'The Great Bear', rating: 7)

      expect(park.ride_average_rating.round(2)).to eq(7)
    end
  end
end