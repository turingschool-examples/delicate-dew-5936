class AmusementParksController < ApplicationController
    def show
        @park = AmusementPark.find(params[:id])
    end

    private

    def mechanic_params
        params.permit(:id, :name, :admission_cost, :created_at, :updated_at)
    end
end