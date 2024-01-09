class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def edit
    @mechanic = Mechanic.find(params[:id])
    @ride = Ride.find(params[:ride_id])

    @mechanic.rides << @ride

    redirect_to mechanic_path(@mechanic)
  end
end
