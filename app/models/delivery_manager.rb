# frozen_string_literal: true

class DeliveryManager < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  self.primary_key = :uuid
end
