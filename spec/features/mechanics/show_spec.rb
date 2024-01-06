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
    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
  end
  
  it "completes User Story 2 - Add a Ride to a Mechanic" do
    amusement_park = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    ride_1 = amusement_park.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    ride_2 = amusement_park.rides.create!(name: "Tilt-a-Whirl", thrill_rating: 11, open: true)
    mechanic = Mechanic.create!(name: "Kara Smith", years_experience: 11)

    # As a user,
    # When I go to a mechanic's show page
    visit mechanic_path(mechanic)
    # I see a form to add a ride to their workload
    save_and_open_page
    expect(page).to have_field("Ride Id:")
    expect(page).to have_button("Put that Carny to work!")
    # When I fill in that field with an id of an existing ride and click Submit
    # I’m taken back to that mechanic's show page
    # And I see the name of that newly added ride on this mechanic's show page.

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
