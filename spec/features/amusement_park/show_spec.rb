require 'rails_helper'

RSpec.describe "amusement_park show page", type: :feature do
  it "completes User Story 3 - Amusement Park's Rides" do
    amusement_park = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    ride_1 = amusement_park.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    ride_2 = amusement_park.rides.create!(name: "Tilt-a-Whirl", thrill_rating: 11, open: true)
    mechanic = Mechanic.create!(name: "Kara Smith", years_experience: 11)

    mechanic.rides << ride_1
    mechanic.rides << ride_2

    visit amusement_park_path(amusement_park)

    expect(page).to have_content(amusement_park.name)
    expect(page).to have_content(amusement_park.admission_cost)
    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(mechanic.name)

  end
end
