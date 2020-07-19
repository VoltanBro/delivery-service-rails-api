# frozen_string_literal: true

class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table(:packages, id: false, primary_key: :uuid) do |t|
      t.uuid     :uuid, default: "gen_random_uuid()", null: false
      t.datetime :estimated_delivery_date
      t.string   :tracking_number, null: false
      t.string   :delivery_status, default: "new"

      t.integer "courier_id"
      t.index ["courier_id"], name: "index_packages_on_courier_id"
      t.timestamps
    end
  end
end
