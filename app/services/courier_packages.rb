# frozen_string_literal: true

class CourierPackages
  require "securerandom"

  def self.check_status(package, status)
    if status == "pickuped"
      package.update(delivery_status: status)
      package
    elsif status == "cancelled"
      package.update(delivery_status: "processing")
      package
    end
  end

  def self.change_delivery_status(package, status)
    package.update(delivery_status: status)
  end

  def self.generate_confirm_url(package)
    package.update(token: SecureRandom.hex(10), token_exp_time: Time.now + 10.minutes)
    "/api/v1/packages/#{package.uuid}/confirm_delivery" # ?confirmation_token=#{package.token}"
  end

  def self.token_valid?(package)
    package.token_exp_time - Time.now <= 10.minutes
  end
end
