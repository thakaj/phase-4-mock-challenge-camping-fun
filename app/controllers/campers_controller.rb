class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    def index
        campers = Camper.all
        render json: campers, except: [:created_at, :updated_at]
    end

    def show
        campers = Camper.find_by(params[:id])
        render json: campers, except: [:created_at, :updated_at]
    end
    def create
        campers = Camper.create(name: params[:name], age: params[:age])
        if campers.valid?
        render json: campers, except: [:created_at, :updated_at]
        else
            render json: {errors: campers.errors}, status: :unprocessable_entity
        end
    end
    private
    def render_not_found
        render json: {error: "Camper not found"}, status: 422
    end

end
