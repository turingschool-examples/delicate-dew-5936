require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
  end

  describe "instance methods" do
    describe "#mechanics_working_at_park" do
      it "shows the name of all mechanics working at a park" do
        @park = AmusementPark.create!(name: "Blonkoland", admission_cost: 20)
        @park_2 = AmusementPark.create!(name: "Derpis Hills", admission_cost: 20)
        @ride = @park.rides.create!(name: "The Pukinator", thrill_rating: 7, open: true)
        @ride_2 = @park_2.rides.create!(name: "Blongorgbulous", thrill_rating: 7, open: true)
        @mechanic_1 = @ride.mechanics.create!(name: "Mario", years_experience: 32)
        @mechanic_2 = @ride.mechanics.create!(name: "Luigi", years_experience: 29)
        @mechanic_3 = @ride.mechanics.create!(name: "Jim Harbaugh", years_experience: 4)
        @mechanic_4 = @ride_2.mechanics.create!(name: "John Harbaugh", years_experience: 4)

        expect(@park.mechanics_working_at_park.sort).to eq([@mechanic_1, @mechanic_2, @mechanic_3].sort)
      end
    end
  end
end