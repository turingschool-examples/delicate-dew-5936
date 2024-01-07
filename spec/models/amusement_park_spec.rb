require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
  end

  describe "instrance methods" do
    it "has a #unique_mechanics method" do
    park1 = AmusementPark.create!(name: "Happy Go Lucky Times Fun World Great Job", admission_cost: 799)
    ride1 = park1.rides.create!(name: "Flying Pancakes", thrill_rating: 3, open: false)
    ride2 = park1.rides.create!(name: "Unknown Fate", thrill_rating: 7, open: false)
    ride3 = park1.rides.create!(name: "Rotating Orbs", thrill_rating: 10, open: false)
    mechanic1 = Mechanic.create!(name: "Bill Jackson", years_experience: 1)
    mechanic2 = Mechanic.create!(name: "Leonard Cohen", years_experience: 57)
    mechanic3 = Mechanic.create!(name: "Crabdul", years_experience: 20)
    mechanic1.rides << [ride1, ride2, ride3]
    mechanic2.rides << [ride1, ride2, ride3]
    mechanic3.rides << [ride1, ride2, ride3]

    expect(park1.unique_mechanics).to eq([mechanic1, mechanic2, mechanic3])
    expect(park1.unique_mechanics.length).to eq(3)
    end
  end
end
