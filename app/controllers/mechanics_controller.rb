class MechanicsController < ApplicationController
  def index
  end 

  def show
    @mechanic = Mechanic.find(params[:id])
  end

end