# frozen_string_literal: true

module Api
  module V1
    class CouriersController < ApiController
      def index
        @couriers = Courier.all
        render json: @couriers
      end

      def show
        @courier = Courier.find(user_params)
        render json: @courier.as_json(only: [:id, :email])
      end

      def update
        @courier = Courier.find(params[:id])
        return render json: { msg: "Image already exist" }, status: :not_acceptable if @courier.driver_licence.present?

        @courier.update(driver_licence: params[:driver_licence])
        render json: { msg: "Driver licence was upload" }
      end

      private
        def user_params
          params.require(:courier).permit(:email, :password, :driver_licence)
        end
    end
  end
end
