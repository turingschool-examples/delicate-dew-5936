class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def create 
    @mechanic = Mechanic.new(@mechanic_params)
    # if @mechanic.save
    #   redirect_to @mechanic
    # else
    #   render :new
    # end
  end
end
