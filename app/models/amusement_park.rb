class AmusementPark < ApplicationRecord
  has_many :rides

  def unq_mechs
    # self.joins(:ride_mechanics)
    # .where 
  end
end