class RideMechanic < ApplicationRecord
    belong_to :ride
    belong_to :mechanic
end