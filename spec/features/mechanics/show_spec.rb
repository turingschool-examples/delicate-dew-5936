require 'rails_helper'

RSpec.describe "mechanics/show.html.erb", type: :view do

  it "completes User Story 1 - Mechanic Show Page" do
  
    @mechanic = Mechanic.create!(name: "Kara Smith", years_experience: 11)

    # As a user,
    # When I visit a mechanic show page
    visit mechanic_path(mechanic)
    # I see their name, years of experience, and the names of all rides they are working on.

  end
end
