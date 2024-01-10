require "rails_helper"

RSpec.describe "Mechanic Show Page", type: :feature do
    before(:each) do
        @mechanic_1 = Merchant.create(name: "Quin Nordmark", years_experience: 2)
        @amusement_park_1 = AmusementPark.create(name: "Gardens", admission_cost: 40)
        @ride_1 = @amusement_park_1.rides.create(name: "Upsider", thrill_rating: 3, open: true)

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
end