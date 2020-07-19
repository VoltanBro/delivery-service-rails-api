# frozen_string_literal: true

class CancelPackage
  def self.check_status(package)
    if package.delivery_status == "new" || package.delivery_status == "processing"
      package.delivery_status = "cancelled"
      package.save
    end
  end
end
