class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


    def index
        spices = Spice.all
        render json: spices
    end

    def create
        spices = Spice.create(spice_params)
        render json: spices, status: :created
    end

    def update
        spices = find_spice
        spices.update(spice_params)
        render json: spices
    end

    def destroy
        spices = find_spice
        spices.destroy
        render json: {}
    end

    private

    def find_spice
        Spice.find(params[:id])
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def render_not_found_response
        render json: { error: "Spice not found" }, status: :not_found
    end

end
