class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

    def index
        gyms = Gym.all
        render json: gyms
    end

    def show
        gym = Gym.find(params[:id])
        render json: gym
    end

    def update
        gym = Gym.find(params[:id])
        gym.update!(gym_params)
        render json: gym
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        head :no_content
    end

    private

    def gym_params
        params.permit(:name, :address)
    end

    def record_not_found
        render json: {error: "Gym not found"}, status: 404
    end

    def invalid_record(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
