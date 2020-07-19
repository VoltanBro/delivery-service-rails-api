# frozen_string_literal: true

class CreateCouriers < ActiveRecord::Migration[6.0]
  def change
    create_table :couriers do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
