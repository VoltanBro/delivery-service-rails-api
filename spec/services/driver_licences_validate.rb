# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DriverLicencesValidate do
  let!(:courier) { Courier.create(name: 'Potato', email: 'testpotato@test.com', password: '123123', courier_valid: true) }
  let!(:courier2) { Courier.create(name: 'Potato2', email: 'testpotato2@test.com', password: '123123', courier_valid: false) }
  it "Return false if courier has already valid licence" do
    expect(DriverLicencesValidate.licence_valid(courier)).to eq(false)
  end
  it "Return true if courier had non-valid licence" do
    expect(DriverLicencesValidate.licence_valid(courier2)).to eq(true)
  end
end
