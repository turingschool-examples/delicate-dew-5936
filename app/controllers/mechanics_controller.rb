class MechanicsController < ApplicationController
    def show
        @mechanic = Mechanic.find(params[:id])
    end

    private

    def mechanic_params
        params.permit(:id, :name, :years_experience, :created_at, :updated_at)
    end
end