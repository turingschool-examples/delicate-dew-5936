class RideMechanicsController < ApplicationController 
    def create 
        mechanic = Mechanic.find(params[:id])
        ride = Ride.find(params[:id])

        ride.mechanics << mechanic
        mechanic.rides << ride

        redirect_to "/mechanics/#{mechanic.id}"
    end
end