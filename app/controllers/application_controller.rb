# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery
  include Pundit

  def authenticate_active_delivery_manager!
    authenticate_delivery_manager!
    unless current_delivery_manager.enabled?
      sign_out(current_delivery_manager)
      redirect_to root_path
    end
  end
end
