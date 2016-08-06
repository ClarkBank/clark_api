require 'rails_helper'

describe User do
  it { is_expected.to have_secure_password }
  it { is_expected.to have_many(:assignments) }
  it { is_expected.to have_many(:roles) }

  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_length_of(:password) }

  describe '#role?' do
    subject { described_class.new }

    it 'user has not role' do
      expect(subject.role? :admin).to eq false
    end

    it 'user has role' do
      subject.roles << Role.new(name: 'admin')
      expect(subject.role? :admin).to eq true
    end
  end
end
