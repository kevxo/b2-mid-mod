require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'when I visit the the mechanics index page' do
    it 'should see a header All Mechanics and a list of experience years' do
      mechanic1 = Mechanic.create!(name: 'Sam Mills', experience: 10)
      mechanic2 = Mechanic.create!(name: 'Kara Smith', experience: 11)

      visit '/mechanics'

      expect(page).to have_content('All Mechanics')
      expect(page).to have_content("#{mechanic1.name} - #{mechanic1.experience} years of experience")
      expect(page).to have_content("#{mechanic2.name} - #{mechanic2.experience} years of experience")
    end
  end
end