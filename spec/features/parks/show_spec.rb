require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the amusement parks show page' do
    it 'should see name, admission price, ride names, average rating' do
      park = Park.create!(name: 'Hershey Park', price: 50.00)
      ride1 = park.rides.create!(name: 'Lightning Racer', rating: 7)
      ride2 = park.rides.create!(name: 'Storm Runner', rating: 8)
      ride3 = park.rides.create!(name: 'The Great Bear', rating: 7)

      visit "/parks/#{park.id}"


      expect(page).to have_content(park.name)
      expect(page).to have_content("Admissions : $#{park.price}")

      within "#rides-info" do
        expect(page).to have_content("#{ride1.name}")
        expect(page).to have_content("#{ride2.name}")
        expect(page).to have_content("#{ride3.name}")
        expect(page).to have_content("Average Thrill rating of Rides: #{park.ride_average_rating.round(2)}")
      end
    end
  end
end