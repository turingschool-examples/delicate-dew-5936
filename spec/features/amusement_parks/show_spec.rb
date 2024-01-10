require "rails_helper"

RSpec.describe "the amusement parks show page" do
    describe "User Story 3" do
        # As a visitor,
        # When I visit an amusement park’s show page,
        # Then I see the name and price of admissions for that amusement park
        # And I see the names of all mechanics that are working on that park's rides,
        # And I see that the list of mechanics is unique

        before :each do
            @park = AmusementPark.create!(name: "Blonkoland", admission_cost: 20)
            @ride = @park.rides.create!(name: "The Pukinator", thrill_rating: 7, open: true)
            @mechanic_1 = @ride.mechanics.create!(name: "Mario", years_experience: 32)
            @mechanic_2 = @ride.mechanics.create!(name: "Luigi", years_experience: 29)
            @mechanic_3 = @ride.mechanics.create!(name: "Jim Harbaugh", years_experience: 4)
        end
    
        it "displays the amusement park's name" do
            visit amusement_park_path(@park.id)
    
            expect(page).to have_content(@park.name)
        end
    
        it "displays the amusement park's admission cost" do
            visit amusement_park_path(@park.id)
    
            expect(page).to have_content("Admission Cost: #{@park.admission_cost}")
        end
    
        it "displays the names of all rides in the park" do
            @ride_2 = @park.rides.create!(name: "The Reverse Mortgage", thrill_rating: 10, open: false)

            visit amusement_park_path(@park.id)

            expect(page).to have_content(@ride.name)
            expect(page).to have_content(@ride_2.name)
            expect(page).to_not have_content("Bagman")

            @ride_3 = @park.rides.create!(name: "Bagman's Crumper", thrill_rating: 3, open: true)

            visit amusement_park_path(@park.id)

            expect(page).to have_content(@ride.name)
            expect(page).to have_content(@ride_2.name)
            expect(page).to have_content(@ride_3.name)
        end

        it "displays the names of all mechanics working in the park" do
            @park_2 = AmusementPark.create!(name: "Derpis Hills", admission_cost: 20)
            @ride_2 = @park_2.rides.create!(name: "Blongorgbulous", thrill_rating: 7, open: true)
            @mechanic_4 = @ride_2.mechanics.create!(name: "John Harbaugh", years_experience: 4)

            visit amusement_park_path(@park.id)

            expect(page).to have_content(@mechanic_1.name)
            expect(page).to have_content(@mechanic_2.name)
            expect(page).to have_content(@mechanic_3.name)
            expect(page).to_not have_content(@mechanic_4.name)

        end
    end
end