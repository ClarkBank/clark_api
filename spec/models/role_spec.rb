require 'rails_helper'

describe Role do
  it { is_expected.to have_many(:assignments) }
  it { is_expected.to have_many(:users) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_presence_of(:name) }
end
