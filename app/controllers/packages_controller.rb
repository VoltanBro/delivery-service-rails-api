# frozen_string_literal: true

class PackagesController < ApplicationController
  def new
  end

  def index
    @packages = Package.all.order(created_at: :desc)
  end

  def show
    @package = Package.find(params[:id])
  end

  def create
    @package = Courier.find(params[:courier_id]).packages.create(package_params)
    redirect_to courier_path(params[:courier_id])
  end


  private
    def package_params
      params.require(:package).permit(:tracking_number, :delivery_status)
    end
end
