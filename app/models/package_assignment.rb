# frozen_string_literal: true

class PackageAssignment < ApplicationRecord
  belongs_to :courier
  belongs_to :package

  before_create :package_status_before_assignment
  after_save :change_delivery_status


  def package_status_before_assignment
    if package.delivery_status != "processing"
      errors.add(:package, "Incorrect status. You have to choose package with status - 'processing'")
    end
  end

    private
      def change_delivery_status
        package.update(delivery_status: :assigned)
      end
end
