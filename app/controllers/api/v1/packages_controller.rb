# frozen_string_literal: true

module Api
  module V1
    class PackagesController < ApiController
      def index
        @courier = Courier.find(params[:courier_id])
        @packages = @courier.packages
        render json: @packages.as_json(only: [:estimated_delivery_date, :tracking_number, :delivery_status])
      end

      def show
        @package = Package.find(params[:id])
        render json: @package.as_json(only: [:estimated_delivery_date, :tracking_number, :delivery_status])
      end

      def all_packages
        @packages = Package.all
        render json: @packages
      end

      def update
        @courier = Courier.find(params[:courier_id])
        @package = @courier.packages.find(params[:id])
        if params[:status] == "pickuped"
          @package.update(delivery_status: :pickuped)
          render json: @package.as_json(only: [:estimated_delivery_date, :tracking_number, :delivery_status])
        end
      end

      def generate_confirm_delivery_url
        package = current_courier.packages.find_by(uuid: params[:id])
        render json: { confirm_delivery_url: CourierPackages.generate_confirm_url(package) }
      end

      def confirm_delivery_url
        package = Package.find(params[:id])
        if CourierPackages.token_valid?(package)
          CourierPackages.change_delivery_status(package, :delivered)
          render json: package.as_json(only: [:tracking_number, :delivery_status])
        else
          render json: "Token is invalid"
        end
      end
    end
  end
end
