require 'rails_helper'

RSpec.describe 'show spec', type: :feature do
  describe 'as a user' do
    # Story 1 - Mechanic Show Page
    it 'displays mechanic info' do
      park = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

      ride_1 = park.ride.create!(name: "The Hurler", thrill_rating: 7, open: false)

      mech_1 = Mechanic.create!(name: "larry", years_experience: 11)

      RideMechanic.create!(ride: ride_1, mechanic: mech_1)
      # When I visit a mechanic show page
      visit  mechanics_path(mech_1)
      # I see their name, years of experience, and the names of all rides they are working on.
      require 'pry'; binding.pry
      expect(page).to have_content(mech_1.name)
      expect(page).to have_content(mech_1.years_experience)
      expect(page).to have_content(mech_1.ride)
    end
  end
end