class AmusementPark < ApplicationRecord
  has_many :rides

  validates :name, :admission_cost, presense: true
end