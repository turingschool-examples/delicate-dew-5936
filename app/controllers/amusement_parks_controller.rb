class AmusementParksController < ApplicationController

  def show
    @park = AmusementPark.find(params[:id])
    @mechanics = Mechanic.joins(:mechanic_rides, :rides).where("amusement_park_id = #{@park.id}").distinct
    @rides = @park.rides
    # @rides_2 = Ride.joins(:mechanics).where("amusement_park_id = #{@park.id}")
    # r = Ride.joins(:mechanic_rides, :mechanics).where("rides.amusement_park_id #{@park.id}")

  end


end