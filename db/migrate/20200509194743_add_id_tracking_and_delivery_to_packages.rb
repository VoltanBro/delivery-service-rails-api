# frozen_string_literal: true

class AddIdTrackingAndDeliveryToPackages < ActiveRecord::Migration[6.0]
  def change
    add_index(:packages, :delivery_status)
    add_index(:packages, :tracking_number)
  end
end
