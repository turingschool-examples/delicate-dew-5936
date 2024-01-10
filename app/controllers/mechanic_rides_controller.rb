class MechanicRidesController < ApplicationController
    def create
        mechanic = Mechanic.find(params[:mechanic_id])
        ride = Ride.find(params[:form_ride_id])

        mechanic.rides << ride

        redirect_to mechanic_path(mechanic.id)
    end
end