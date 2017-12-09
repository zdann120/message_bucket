class BucketPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def update?
    record.user == user
  end

  def create?
    true
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
