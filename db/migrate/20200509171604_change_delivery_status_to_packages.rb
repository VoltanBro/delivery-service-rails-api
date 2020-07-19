# frozen_string_literal: true

class ChangeDeliveryStatusToPackages < ActiveRecord::Migration[6.0]
  remove_column :packages, :delivery_status

  def change
    add_column :packages, :delivery_status, :integer, default: 0
  end
end
