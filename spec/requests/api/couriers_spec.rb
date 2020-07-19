# frozen_string_literal: true

require "swagger_helper"
require "devise/jwt/test_helpers"

RSpec.describe "Couriers", type: :request do
  let!(:courier) { Courier.create(email: "testcourier@test.com", password: "123123") }
  let!(:package) { Package.create(estimated_delivery_date: Time.new + 1.day, delivery_status: :assigned) }
  let!(:package_assingment) { PackageAssignment.create(courier_id: courier.id, package_id: package.id) }
  let!(:id) { courier.id }
  let!(:id_package) { package.id }
  let(:Authorization) { Devise::JWT::TestHelpers.auth_headers({}, courier).fetch("Authorization") }
  path "/api/v1/sign_in/" do
    post "Login courier" do
      tags "Couriers"
      security [{ bearerAuth: [] }]
      consumes "application/json"
      parameter name: :Authorization, in: :body, schema: {
          properties: {
              courier: {
                  properties: {
                      email: { type: :string },
                      password: { type: :string },
                  } } }
      }
      produces "application/json"

      response(201, "OK") do
        let(:courier) { Courier.create(email: "testcourier@test.com", password: "123123", courier_valid: true) }
        let(:params) { { courier: { email: courier.email, password: courier.password } } }
        let(:Authorization) { Devise::JWT::TestHelpers.auth_headers({}, courier).fetch("Authorization") }
        run_test!
      end

      response(403, "Forbidden") do
        let(:courier) { Courier.create(email: "wrongemail@test.com", password: "wrongpassword", courier_valid: false) }
        let(:params) { { email: courier.email, password: courier.password } }
        let(:Authorization) { Devise::JWT::TestHelpers.auth_headers({}, courier).fetch("Authorization") }
        run_test!
      end
    end
  end

  path "/api/v1/couriers/{id}/packages" do
    get "Assigned packages" do
      tags "Couriers"
      security [{ bearerAuth: [] }]
      consumes "application/json"
      parameter name: :id, in: :path, type: :string
      produces "application/json"

      response(200, "OK") do
        run_test!
      end
    end
  end

  path "/api/v1/couriers/{id}/packages/{id_package}?status={delivery_status}" do
    patch "Pickuped package" do
      tags "Couriers"
      security [{ bearerAuth: [] }]
      consumes "application/json"
      parameter name: :id, in: :path, type: :string
      parameter name: :id_package, in: :path, type: :string
      parameter name: :delivery_status, in: :path, type: :string
      produces "application/json"

      response(200, "OK") do
        let!(:delivery_status) { "pickuped" }
        let!(:Authorization) { Devise::JWT::TestHelpers.auth_headers({}, courier).fetch("Authorization") }
        run_test!
      end
    end
  end
end
