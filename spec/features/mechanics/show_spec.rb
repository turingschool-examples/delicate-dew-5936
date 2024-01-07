require "rails_helper"


RSpec.describe Mechanic, type: :feature do
  before(:each) do
  @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

  @mechanic_1 = Mechanic.create!(name: "Tom Jones", years_experience: 17)
  @mechanic_2 = Mechanic.create!(name: "Sandra Boop", years_experience: 10)

  @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
  @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
  @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

  @mr_1 = MechanicRide.create!(ride_id: @hurler.id, mechanic_id: @mechanic_1.id)
  @mr_2 = MechanicRide.create!(ride_id: @scrambler.id, mechanic_id: @mechanic_1.id)
  @mr_3 = MechanicRide.create!(ride_id: @ferris.id, mechanic_id: @mechanic_1.id)

  @mr_4 = MechanicRide.create!(ride_id: @scrambler.id, mechanic_id: @mechanic_2.id)
  end

  it "has a show page with a mechanics attributes displayed" do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content("Tom Jones")
    expect(page).to have_content(17)
    expect(page).to have_content(@hurler.name)
    expect(page).to have_content(@scrambler.name)
    expect(page).to have_content(@ferris.name)

    visit "/mechanics/#{@mechanic_2.id}"

    expect(page).to have_content("Sandra Boop")
    expect(page).to have_content(10)
    expect(page).to have_content(@scrambler.name)
    expect(page).to_not have_content(@ferris.name)
    expect(page).to_not have_content(@hurler.name)
  end
end