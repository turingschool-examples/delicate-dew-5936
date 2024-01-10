class RideMechanicsController < ApplicationController 
    def create 
        mechanic = Mechanic.find(params[:mechanic_id])
        ride = Ride.find(params[:ride_id])

        ride.mechanics << mechanic
        mechanic.rides << ride

        redirect_to "/mechanics/#{mechanic.id}"
    end
end