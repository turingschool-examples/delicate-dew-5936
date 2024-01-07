require "rails_helper"

RSpec.describe "AmusementPark show page", type: :feature do
  it "has the name and price for the park, and a unique list of mechanics working on the park's rides" do
    park1 = AmusementPark.create!(name: "Happy Go Lucky Times Fun World Great Job", admission_cost: 799)
    ride1 = park1.rides.create!(name: "Flying Pancakes", thrill_rating: 3, open: false)
    ride2 = park1.rides.create!(name: "Unknown Fate", thrill_rating: 7, open: false)
    ride3 = park1.rides.create!(name: "Rotating Orbs", thrill_rating: 10, open: false)
    mechanic1 = Mechanic.create!(name: "Bill Jackson", years_experience: 1)
    mechanic2 = Mechanic.create!(name: "Leonard Cohen", years_experience: 57)
    mechanic3 = Mechanic.create!(name: "Crabdul", years_experience: 20)
    mechanic1.rides << [ride1, ride2, ride3]
    mechanic2.rides << [ride1, ride2, ride3]
    mechanic3.rides << [ride1, ride2, ride3]

    visit amusement_park_path(park1)

    expect(page).to have_content("Happy Go Lucky Times Fun World Great Job")
    expect(page).to have_content("Price of Admission: $799")
    expect(page).to have_content("Mechanics Working on This Park's Rides:")
    expect(page).to have_content("Bill Jackson, Years Experience: 1")
    expect(page).to have_content("Leonard Cohen, Years Experience: 57")
    expect(page).to have_content("Crabdul, Years Experience: 20")
  end
end
