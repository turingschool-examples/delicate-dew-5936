require 'rails_helper'

RSpec.describe "mechanics/show.html.erb", type: :feature do

  it "completes User Story 1 - Mechanic Show Page" do
    amusement_park = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    ride_1 = amusement_park.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    ride_2 = amusement_park.rides.create!(name: "Tilt-a-Whirl", thrill_rating: 11, open: true)
    mechanic = Mechanic.create!(name: "Kara Smith", years_experience: 11)

    mechanic.rides << ride_1
    mechanic.rides << ride_2

    # As a user,
    # When I visit a mechanic show page
    visit mechanic_path(mechanic)
    # I see their name, years of experience, and the names of all rides they are working on.
    expect(page).to have_content(mechanic.name)
    expect(page).to have_content(mechanic.years_experience)
    # and the names of all rides they are working on.

  end
end
