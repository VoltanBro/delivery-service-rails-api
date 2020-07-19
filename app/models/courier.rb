# frozen_string_literal: true

class Courier < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  mount_uploader :driver_licence, ImageUploader

  self.skip_session_storage = [:http_auth, :params_auth]

  def to_s
    email.to_s
  end

  has_many :package_assignment, dependent: :destroy
  has_many :packages, through: :package_assignment
end
