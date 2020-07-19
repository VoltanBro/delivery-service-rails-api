# frozen_string_literal: true

require "rails_helper"

RSpec.describe Package, type: :model do
  let(:package) { Package.create(estimated_delivery_date: (Time.now + 7.day)) }
  it "Check format tracking_number" do
    expect(package.tracking_number).to match(/^YA[\d]{8}AA/)
  end

  it "Check enum statuses for package" do
    should define_enum_for(:delivery_status).
        with_values([:new, :processing, :delivered, :cancelled, :assigned, :pickuped]).
        with_prefix
  end
end
