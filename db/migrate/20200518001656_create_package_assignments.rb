# frozen_string_literal: true

class CreatePackageAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :package_assignments do |t|
      t.references :package, index: true, type: :uuid, foreign_key_column_for: :uuid
      t.references :courier, index: true, foreign_key: true
      t.timestamps
    end
  end
end
