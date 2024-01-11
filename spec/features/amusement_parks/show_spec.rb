require 'rails_helper'

RSpec.describe 'amusement park show', type: :feature do
  describe 'as a visitor' do
    park = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    ride_1 = park.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    ride_2 = park.rides.create!(name: "The Zipper", thrill_rating: 7, open: false)

    mech_1 = Mechanic.create!(name: "larry", years_experience: 11)
    mech_2 = Mechanic.create!(name: "logan", years_experience: 1)

    RideMechanic.create!(ride: ride_1, mechanic: mech_1)
    RideMechanic.create!(ride: ride_2, mechanic: mech_1)
    RideMechanic.create!(ride: ride_2, mechanic: mech_2)

    # Story 3 - Amusement Park Show page
    xit 'displays prices and unique machanics for that park' do
      # When I visit an amusement park’s show page,
      visit amusement_park_path(park)
      # Then I see the name and price of admissions for that amusement park
      expect(page).to have_content(park.name)
      expect(page).to have_content(park.admission_cost)
      # And I see the names of all mechanics that are working on that park's rides,
      # And I see that the list of mechanics is unique
      expect(page).to have_content(mech_1.name, count: 1)
      expect(page).to have_content(mech_2.name, count: 1)
    end
  end
end