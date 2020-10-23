require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'when I go to the mechanics show page' do
    it 'should see their name, years of experience, rides that are being worked on' do
      park = Park.create!(name: 'Hershey Park', price: 50.00)
      mechanic2 = Mechanic.create!(name: 'Kara Smith', experience: 11)
      ride1 = park.rides.create!(name: 'The Frog Hopper', rating: 7)
      ride2 = park.rides.create!(name: 'Fahrenheit', rating: 8)
      ride3 = park.rides.create!(name: 'The Kiss Raise', rating: 7)
      RideMechanic.create(ride_id: ride1.id, mechanic_id: mechanic2.id)
      RideMechanic.create(ride_id: ride2.id, mechanic_id: mechanic2.id)
      RideMechanic.create(ride_id: ride3.id, mechanic_id: mechanic2.id)
      visit "/mechanics/#{mechanic2.id}"

      expect(page).to have_content("Mechanic: #{mechanic2.name}")
      expect(page).to have_content("Years of Experience: #{mechanic2.experience}")

      within "#current-rides" do
        expect(page).to have_content("Current rides they're working on:")
        expect(page).to have_content(ride1.name)
        expect(page).to have_content(ride2.name)
        expect(page).to have_content(ride3.name)
      end

      expect(page).to have_content('Add a ride to workload:')

      name = 'The King'
      rating = 9
      fill_in :name, with: name
      fill_in :rating, with: rating

      save_and_open_page
      expect(page).to have_button('Submit')
      click_on 'Submit'
      expect(current_path).to eq("/mechanics/#{mechanic2.id}")
    end
  end
end