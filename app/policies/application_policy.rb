# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :courier, :record

  def initialize(user, record)
    @courier = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :courier, :scope

    def initialize(user, scope)
      @courier = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
