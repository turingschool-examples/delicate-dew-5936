class MechanicRidesController < ApplicationController

   def create
    ride = Ride.find(params[:ride_id])
    mechanic = Mechanic.find(params[:mechanic_id])
    mechanic_ride = MechanicRide.create(mechanic_id: mechanic.id, ride_id: ride.id)
    redirect_to "/mechanics/#{mechanic.id}"
   end
end