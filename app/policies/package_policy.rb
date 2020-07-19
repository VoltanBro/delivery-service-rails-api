# frozen_string_literal: true

class PackagePolicy < ApplicationPolicy
  attr_reader :courier, :record

  def index?
    courier.enabled?
  end

  def show?
    courier.enabled?
  end

  def create?
    courier.enabled?
  end

  def new?
    create?
  end

  def update?
    courier.enabled?
  end

  def edit?
    update?
  end

  def destroy?
    courier.enabled?
  end
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
