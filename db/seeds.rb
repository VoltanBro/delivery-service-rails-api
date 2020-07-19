 # frozen_string_literal: true

 # This file should contain all the record creation needed to seed the database with its default values.
 # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
 #
 # Examples:
 #
 #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
 #   Character.create(name: 'Luke', movie: movies.first)
 # DeliveryManager.create!(email: "test@test.com", password: "123123", password_confirmation: "123123", enabled: true) if Rails.env.development?
 Courier.create!(email: "testcourier@test.com", password: "123123") if Rails.env.development?
 Courier.create!(email: "testcourier2@test.com", password: "123123") if Rails.env.development?
 Courier.create!(email: "testcourier3@test.com", password: "123123") if Rails.env.development?
 Package.create!(estimated_delivery_date: Time.new + 7.days.to_i, delivery_status: "processing") if Rails.env.development?
 Package.create!(estimated_delivery_date: Time.new + 7.days.to_i) if Rails.env.development?
 Package.create!(estimated_delivery_date: Time.new + 7.days.to_i) if Rails.env.development?
 # PackageAssignment.create!(courier_id: Courier.first.id, package_id: Package.first.uuid)
 DeliveryManager.create!(email: "testmanager@test.com", password: "123123",
                         password_confirmation: "123123", enabled: true) if Rails.env.development?
