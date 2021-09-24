class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    def index
        activities = Activity.all
        render json: activities, except: [:created_at, :updated_at], status: 200
    end
    def destroy
            activities = Activity.find(params[:id])
            activities.destroy
            head :no_content
    end
    private 

    def render_not_found
        render json: { error: "Activity not found" }, status: :not_found
    end

end
