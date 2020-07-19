# frozen_string_literal: true

class DriverLicencesValidate
  def self.licence_valid(courier)
    if courier.courier_valid == false || courier.courier_valid.nil?
      return courier.update(courier_valid: true)

    end
    false
  end
end
