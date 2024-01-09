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

            expect(page).to have_content(@ride.name)
            expect(page).to have_content(@ride_2.name)
            expect(page).to_not have_content(@ride_3.name)
        end
    end

    describe "User Story 2" do
        # As a user,
        # When I go to a mechanic's show page
        # I see a form to add a ride to their workload
        # When I fill in that field with an id of an existing ride and click Submit
        # I’m taken back to that mechanic's show page
        # And I see the name of that newly added ride on this mechanic's show page.

        before :each do
            @park = AmusementPark.create!(name: "Blonkoland", admission_cost: 20)
            @ride = @park.rides.create!(name: "The Pukinator", thrill_rating: 7, open: true)
            @ride_2 = @park.rides.create!(name: "The Reverse Mortgage", thrill_rating: 10, open: false)
            @mechanic = @ride.mechanics.create!(name: "Mario", years_experience: 32)
        end

        it "shows a form to add an existing ride to the mechanic" do
            visit "/mechanics/#{@mechanic.id}"
    
            expect(page).to have_field(:form_ride_id)
        end

        it "adds an existing ride to the mechanic upon form completion, and refreshes the page" do
            visit "/mechanics/#{@mechanic.id}"

            expect(page).to_not have_content(@ride_2.name)

            save_and_open_page

            fill_in :form_ride_id, with: "#{@ride_2.id}"
            click_button "Submit"

            save_and_open_page

            expect(page).to have_content(@ride_2.name)
        end
    end
end