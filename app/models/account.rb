class Account < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :user_id

  def amount_valid?(amount)
    valid = amount > 0
    puts 'Transaction failed! Amount must be greater than 0.00' unless valid
    return valid
  end
end
