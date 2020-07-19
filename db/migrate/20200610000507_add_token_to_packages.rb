# frozen_string_literal: true

class AddTokenToPackages < ActiveRecord::Migration[6.0]
  def change
    add_column :packages, :token, :string
    add_column :packages, :token_exp_time, :datetime
  end
end
