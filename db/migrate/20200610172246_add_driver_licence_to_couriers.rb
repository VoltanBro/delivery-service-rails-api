# frozen_string_literal: true

class AddDriverLicenceToCouriers < ActiveRecord::Migration[6.0]
  def change
    add_column :couriers, :driver_licence, :string
    add_column :couriers, :courier_valid, :boolean, default: nil
  end
end
