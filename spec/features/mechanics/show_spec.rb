require "rails_helper"

RSpec.describe "Mechanic Show Page", type: :feature do
    before(:each) do
        @mechanic_1 = Mechanic.create(name: "Quin Nordmark", years_experience: 2)
        @amusement_park_1 = AmusementPark.create(name: "Gardens", admission_cost: 40)
        @ride_1 = @amusement_park_1.rides.create(name: "Upsider", thrill_rating: 3, open: true)
        @ride_2 = @amusement_park_1.rides.create(name: "Loopie", thrill_rating: 4, open: true)

        @mechanic_1.rides << @ride_1
        @ride_1.mechanics << @mechanic_1
    end

    it "Story 1 - Mechanic Show Page" do
        # When I visit a mechanic show page
        visit "/mechanics/#{@mechanic_1.id}"
        # I see their name, years of experience, and the names of all rides they are working on"
        expect(page).to have_content("Quin Nordmark")
        expect(page).to have_content("2")
        expect(page).to have_content("Upsider")
    end
    
    it "Story 2 - Add a Ride to a Mechanic" do
        # When I go to a mechanic's show page
        visit "/mechanics/#{@mechanic_1.id}"
        # I see a form to add a ride to their workload
        expect(page).to have_field("New ride", with: "id")
        expect(page).to have_button("Submit")
        # When I fill in that field with an id of an existing ride and click Submit
        fill_in "New ride", with: @ride_2.id
        click_on("Submit")
        # I’m taken back to that mechanic's show page
        expect(page).to have_current_path("/mechanics/#{@mechanic_1.id}")
        # And I see the name of that newly added ride on this mechanic's show page.
        expect(page).to have_content("Loopie")
    end
end