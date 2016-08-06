require 'rails_helper'

describe Assignment do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:role) }
end
