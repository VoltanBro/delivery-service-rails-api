# frozen_string_literal: true

require "swagger_helper"
require "devise/jwt/test_helpers"

RSpec.describe "Packages", type: :request do
  let!(:courier) { Courier.create(email: "testcourier@test.com", password: "123123") }
  let!(:package) { Package.create(estimated_delivery_date: Time.new + 1.day) }
  let!(:package_assignment) { PackageAssignment.create(courier_id: courier.id, package_id: package.id) }
  let!(:token) { CourierPackages.generate_confirm_url(package) }
  let!(:Authorization) { Devise::JWT::TestHelpers.auth_headers({}, courier).fetch("Authorization") }
  path "/api/v1/packages/{id}/confirm" do
    get "Generate delivery confirm url" do
      tags "Couriers"
      security [{ bearerAuth: [] }]
      consumes "application/json"
      parameter name: :id, in: :path, type: :string
      produces "application/json"

      response(200, "OK") do
        let!(:id) { package.uuid }
        run_test!
      end

      response(401, "Unauthorized") do
        let(:courier) { Courier.create(email: "wroncourier@test.com", password: "123123") }
        let(:Authorization) { Devise::JWT::TestHelpers.auth_headers({}, courier).fetch("Authorization") }
      end
    end
  end

  path "/api/v1/packages/{id}/confirm_delivery" do
    post "To confirm package delivery" do
      tags "Couriers"
      security [{ bearerAuth: [] }]
      consumes "application/json"
      parameter name: :id, in: :path, type: :string
      produces "application/json"

      response(200, "OK") do
        let!(:id) { package.uuid }
        run_test!
      end

      response(401, "Unauthorized") do
        let(:courier) { Courier.create(email: "wroncourier@test.com", password: "123123") }
        let(:Authorization) { Devise::JWT::TestHelpers.auth_headers({}, courier).fetch("Authorization") }
      end
    end
  end
end
