require 'rails_helper'

RSpec.describe 'show spec', type: :feature do
  describe 'as a user' do
    # Story 1 - Mechanic Show Page
    it 'displays mechanic info' do
      park = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

      ride_1 = park.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
      ride_2 = park.rides.create!(name: "The Zipper", thrill_rating: 7, open: false)

      mech_1 = Mechanic.create!(name: "larry", years_experience: 11)

      RideMechanic.create!(ride: ride_1, mechanic: mech_1)
      
      # When I visit a mechanic show page
      visit  mechanic_path(mech_1)
      # I see their name, years of experience, and the names of all rides they are working on.
      expect(page).to have_content(mech_1.name)
      expect(page).to have_content(mech_1.years_experience)
      expect(page).to have_content(ride_1.name)
    end

    # Story 2 - Add a Ride to a Mechanic
    it "can add rides to a mechanic and shows their work load" do
      park = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

      ride_1 = park.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
      ride_2 = park.rides.create!(name: "The Zipper", thrill_rating: 7, open: false)

      mech_1 = Mechanic.create!(name: "larry", years_experience: 11)

      RideMechanic.create!(ride: ride_1, mechanic: mech_1)

      # When I go to a mechanic's show page
      visit mechanic_path(mech_1)
      # I see a form to add a ride to their workload
      expect(page).to have_selector('form')
      # When I fill in that field with an id of an existing ride and click Submit
      require 'pry'; binding.pry
      fill_in :id, with: ride_2.id
      click_on "Submit"
      # I’m taken back to that mechanic's show page
      expect(current_path).to eq(mechanic_path(mech_1))
      # And I see the name of that newly added ride on this mechanic's show page.
      expect(page).to have_content(ride_2.name)

      # Ex:
      # Mechanic: Kara Smith
      # Years of Experience: 11

      # Current rides they’re working on:
      #   The Frog Hopper
      #   Fahrenheit
      #   The Kiss Raise

      # Add a ride to workload:
      # Ride Id: |_pretend_this_is_a_textfield_|
      # Submit
    end
  end
end