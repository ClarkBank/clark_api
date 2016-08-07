class UserPolicy < ApplicationPolicy
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
