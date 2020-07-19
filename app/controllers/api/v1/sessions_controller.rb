# frozen_string_literal: true

module Api
  module V1
    class SessionsController < Devise::SessionsController
      skip_before_action :verify_authenticity_token
      respond_to :json

      def create
        if current_courier.courier_valid? || current_courier.courier_valid.nil?
          return super

        end
        render json: { msg: "You should contact our delivery manager for additional information" }, status: 403
      end
    end
  end
end
