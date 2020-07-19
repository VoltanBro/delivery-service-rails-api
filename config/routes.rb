# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"
  ActiveAdmin.routes(self)
  devise_for :delivery_managers, ActiveAdmin::Devise.config

  devise_for :couriers, defaults: { format: :json },
             path: "/api/v1/",
             controllers: {
                 sessions: "api/v1/sessions"
             }


  namespace :api, defaults: { format: :json } do
      namespace :v1 do
          resources :couriers do
            resources :packages
          end
          get "/packages", to: "packages#all_packages"
          get "/packages/:id/confirm", to: "packages#generate_confirm_delivery_url"
          post "/packages/:id/confirm_delivery", to: "packages#confirm_delivery_url"
        end
    end



  root "admin/dashboard#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
