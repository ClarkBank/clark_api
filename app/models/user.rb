class User < ApplicationRecord
  has_secure_password

  has_many :assignments
  has_many :roles, through: :assignments

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }

  def role?(role)
    roles.any? do |r|
      r.name.underscore.to_sym == role
    end
  end
end
