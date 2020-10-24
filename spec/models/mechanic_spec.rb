require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many :ride_mechanics }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe 'instance methods' do
    it 'order_name' do
      park = Park.create!(name: 'Hershey Park', price: 50.00)
      mechanic2 = Mechanic.create!(name: 'Kara Smith', experience: 11)
      ride1 = park.rides.create!(name: 'The Frog Hopper', rating: 7)
      ride2 = park.rides.create!(name: 'Fahrenheit', rating: 8)
      ride3 = park.rides.create!(name: 'The Kiss Raise', rating: 7)
      ride4 = park.rides.create!(name: 'Lightning Racer', rating: 7)
      RideMechanic.create(ride_id: ride1.id, mechanic_id: mechanic2.id)
      RideMechanic.create(ride_id: ride2.id, mechanic_id: mechanic2.id)
      RideMechanic.create(ride_id: ride3.id, mechanic_id: mechanic2.id)
      RideMechanic.create(ride_id: ride4.id, mechanic_id: mechanic2.id)


      expect(mechanic2.order_name).to eq([ride2, ride4, ride1, ride3])
    end
  end
end