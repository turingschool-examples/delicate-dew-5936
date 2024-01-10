require "rails_helper"

RSpec.describe "Amusement Park Show Page", type: :feature do
    before(:each) do
        @mechanic_1 = Mechanic.create(name: "Quin Nordmark", years_experience: 2)
        @amusement_park_1 = AmusementPark.create(name: "Gardens", admission_cost: 40)
        @ride_1 = @amusement_park_1.rides.create(name: "Upsider", thrill_rating: 3, open: true)
        @ride_2 = @amusement_park_1.rides.create(name: "Loopie", thrill_rating: 4, open: true)

        @mechanic_1.rides << @ride_1
        @ride_1.mechanics << @mechanic_1

        @mechanic_1.rides << @ride_2
        @ride_2.mechanics << @mechanic_1
    end
    
    it "Story 3 - Amusement Park Show page" do
        # When I visit an amusement park’s show page,
        visit "/amusement_park/#{@amusement_park_1.id}"
        # Then I see the name and price of admissions for that amusement park
        expect(page).to have_content("Gardens")
        expect(page).to have_content("40")
        # And I see the names of all mechanics that are working on that park's rides,
        expect(page).to have_content("Quin Nordmark")
        # And I see that the list of mechanics is unique
        # I don't know how to test for this
        #save_and_open_page
    end
end