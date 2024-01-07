require "rails_helper"

RSpec.describe "Mechanics show page", type: :feature do
  it "shows the mechanic's name, years of experience and the names of rides they are working on" do
    park1 = AmusementPark.create!(name: "Happy Go Lucky Times Fun World Great Job", admission_cost: 799)
    ride1 = park1.rides.create!(name: "Flying Pancakes", thrill_rating: 3, open: false)
    ride2 = park1.rides.create!(name: "Unknown Fate", thrill_rating: 7, open: false)
    ride3 = park1.rides.create!(name: "Rotating Orbs", thrill_rating: 10, open: false)
    mechanic1 = Mechanic.create!(name: "Bill Jackson", years_experience: 1)
    mechanic1.rides << [ride1, ride2, ride3]

    visit "/mechanics/#{mechanic1.id}"

    expect(page).to have_content("Employee Information")
    expect(page).to have_content("Name: #{mechanic1.name}")
    expect(page).to have_content("Experience: #{mechanic1.years_experience.to_s} Years")
    expect(page).to have_content("Rides I'm Working On:")
    expect(page).to have_content("Flying Pancakes")
    expect(page).to have_content("Rotating Orbs")
    expect(page).to have_content("Unknown Fate")
    save_and_open_page
  end
end
