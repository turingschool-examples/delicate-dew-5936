class AmusementParksController < ApplicationController

  def show
    @amus = AmusementPark.find(params[:id])
  end
end