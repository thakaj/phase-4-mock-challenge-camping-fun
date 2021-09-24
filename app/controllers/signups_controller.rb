class SignupsController < ApplicationController
    def create
        signups = Signup.create(signup_params)
        if signups.valid?
            render json: signups.activity, except: [:created_at, :updated_at], status: :created
        else
            render json: {errors: signups.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private
    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
