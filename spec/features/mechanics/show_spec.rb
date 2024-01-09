require "rails_helper"

RSpec.describe "the mechanics show page" do
    describe "User Story 1" do
        # As a user,
        # When I visit a mechanic show page
        # I see their name, years of experience, and the names of all rides they are working on.

        before :each do
            @park = AmusementPark.create!(name: "Blonkoland", admission_cost: 20)
            @ride = @park.rides.create!(name: "The Pukinator", thrill_rating: 7, open: true)
            @mechanic = @ride.mechanics.create!(name: "Mario", years_experience: 32)
        end
    
        it "displays the mechanic's name" do
            visit "/mechanics/#{@mechanic.id}"
    
            expect(page).to have_content(@mechanic.name)
        end
    
        it "displays the mechanic's years of experience" do
            visit "/mechanics/#{@mechanic.id}"
    
            expect(page).to have_content("Years of Experience: #{@mechanic.years_experience}")
        end
    
        it "displays the names of all rides the mechanic is working on" do
            @ride_2 = @park.rides.create!(name: "The Reverse Mortgage", thrill_rating: 10, open: false)
            @ride_3 = @park.rides.create!(name: "Bagman's Crumper", thrill_rating: 3, open: true)
            @mechanic.rides << @ride_2

            visit "/mechanics/#{@mechanic.id}"

            save_and_open_page

            expect(page).to have_content(@ride.name)
            expect(page).to have_content(@ride_2.name)
            expect(page).to_not have_content(@ride_3.name)
        end
    end
end