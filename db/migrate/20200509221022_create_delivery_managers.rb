# frozen_string_literal: true

class CreateDeliveryManagers < ActiveRecord::Migration[6.0]
  def change
    create_table(:delivery_managers, id: false, primary_key: :uuid) do |t|
      t.uuid     :uuid, default: "gen_random_uuid()", null: false
      t.boolean  :enabled

      t.timestamps
    end
  end
end
