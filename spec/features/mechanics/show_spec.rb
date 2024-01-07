require "rails_helper"

RSpec.describe "Mechanics show page", type: :feature do
  it "shows the mechanic's name, years of experience and the names of rides they are working on" do
    park1 = AmusementPark.create!(name: "Happy Go Lucky Times Fun World Great Job", admission_cost: 799)
    ride1 = park1.rides.create!(name: "Flying Pancakes", thrill_rating: 3, open: false)
    ride2 = park1.rides.create!(name: "Unknown Fate", thrill_rating: 7, open: false)
    ride3 = park1.rides.create!(name: "Rotating Orbs", thrill_rating: 10, open: false)
    mechanic1 = Mechanic.create!(name: "Bill Jackson", years_experience: 1)
    mechanic1.rides << [ride1, ride2, ride3]

    visit mechanic_path(mechanic1)

    expect(page).to have_content("Employee Information:")
    expect(page).to have_content("Name: #{mechanic1.name}")
    expect(page).to have_content("Experience: #{mechanic1.years_experience.to_s} Years")
    expect(page).to have_content("Rides I'm Working On:")
    expect(page).to have_content("Flying Pancakes")
    expect(page).to have_content("Rotating Orbs")
    expect(page).to have_content("Unknown Fate")
  end

  it "has a form to add a new ride to the mechanic's workload" do
    park1 = AmusementPark.create!(name: "Happy Go Lucky Times Fun World Great Job", admission_cost: 799)
    ride1 = park1.rides.create!(name: "Flying Pancakes", thrill_rating: 3, open: false)
    ride2 = park1.rides.create!(name: "Unknown Fate", thrill_rating: 7, open: false)
    ride3 = park1.rides.create!(name: "Rotating Orbs", thrill_rating: 5, open: false)
    ride4 = park1.rides.create!(name: "Volcano Kiss", thrill_rating: 8, open: false)
    mechanic1 = Mechanic.create!(name: "Bill Jackson", years_experience: 1)
    mechanic1.rides << [ride1, ride2, ride3]

    visit mechanic_path(mechanic1)

    expect(page).to have_content("Rides I'm Working On:")
    expect(page).to have_content("Flying Pancakes")
    expect(page).to have_content("Rotating Orbs")
    expect(page).to have_content("Unknown Fate")
    expect(page).to_not have_content("Volcano Kiss")
    expect(page).to have_content("Add Ride")
save_and_open_page
    fill_in "Ride", with: ride4.id
    click_button "Submit"

    expect(current_path).to eq(mechanic_path(mechanic1))
    expect(page).to have_content("Rides I'm Working On:")
    expect(page).to have_content("Flying Pancakes")
    expect(page).to have_content("Rotating Orbs")
    expect(page).to have_content("Unknown Fate")
    expect(page).to have_content("Volcano Kiss")
  end
end
