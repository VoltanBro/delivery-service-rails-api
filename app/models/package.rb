# frozen_string_literal: true

class Package < ApplicationRecord
  has_many :package_assignment, dependent: :destroy
  has_many :couriers, through: :package_assignment

  self.primary_key = :uuid

  before_create :generate_tracking_number

  enum delivery_status: %w(new processing delivered cancelled assigned pickuped ), _prefix: true

  def to_s
    tracking_number.to_s
  end

  def cancel_package_status
    if delivery_status_was == "new" || delivery_status_was == "processing"
      self.delivery_status = "cancelled"
    end
  end

  private
    def generate_tracking_number
      loop do
        self.tracking_number = "YA#{8.times.map { rand(10) }.join}AA"
        unless Package.exists?(tracking_number: self.tracking_number)
          break
        end
      end
    end
end
