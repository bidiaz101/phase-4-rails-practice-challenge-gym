class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

    def index
        clients = Client.all
        render json: clients
    end

    def show
        client = Client.find(params[:id])
        render json: client, methods: :total_bill
    end

    def update
        client = Client.find(params[:id])
        client.update!(client_params)
        render json: client
    end

    private

    def client_params
        params.permit(:name, :age)
    end

    def record_not_found
        render json: {error: "Client not found"}, status: 404
    end

    def invalid_record(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
