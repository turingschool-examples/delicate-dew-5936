class AmusementParksController < ApplicationController 
    def show 
        @amusement_park = AmusementPark.find(params[:id])
        @mechanic_list = []
        @amusement_park.rides.each do |ride|
            ride.mechanics.each do |mechanic|
                @mechanic_list.append(mechanic.name)
            end
        end
    end
end