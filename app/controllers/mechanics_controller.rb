class MechanicsController < ApplicationController
  def index
  end 

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    # I dont actually feel like this is supposed to be here. I'm guessing that it might belong in the joins table controller. I'm not exactly sure but I'm not changing the merchants with the from just adding the ride to them. Well the merchants and the rides interact through the joins table. That would also mean my form url is wrong.
  end

end