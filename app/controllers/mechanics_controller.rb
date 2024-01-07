class MechanicsController < ApplicationController

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = Ride.joins(:mechanic_rides).where("mechanic_id = #{@mechanic.id}")
  end


end
