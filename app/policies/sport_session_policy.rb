class SportSessionPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    new?
  end

  def edit?
    user == record.user
  end

  def update?
    edit?
  end

  def delete?
    user == record.user
  end
end
