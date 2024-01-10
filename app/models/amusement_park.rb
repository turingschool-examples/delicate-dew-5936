class AmusementPark < ApplicationRecord
  has_many :rides

  def mechanics_working_at_park
    Mechanic.joins(rides: :amusement_park).where("amusement_parks.id = #{self.id}").distinct
  end
end