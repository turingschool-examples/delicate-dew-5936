require "rails_helper"

RSpec.describe "the mechanics show page" do
    before :each do
        @mechanic = Mechanic.create!(name: "Mario", years_experience: 32)
    end

    it "displays the mechanic's name" do
        visit "/mechanics/#{@mechanic.id}"

        expect(page).to have_content(@mechanic.name)
    end
end