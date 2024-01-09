class AmusementPark < ApplicationRecord
  has_many :rides

  def unique_mechanics
    rides.map{|ride| ride.mechanics}.flatten.uniq #couldn't find a better way to do this with AR in time
  end
end
