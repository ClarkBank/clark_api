class UserPolicy < ApplicationPolicy
  def index?
    user.role?(:admin) or
    user.role?(:user) or
    user.role?(:guest)
  end

  def create?
    user.role?(:admin) or user.role?(:user)
  end

  def deposit?
    user.role?(:admin)
  end

  def withdraw?
    user.role?(:admin)
  end

  def transfer?
    user.role?(:admin)
  end
end
