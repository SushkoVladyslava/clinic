# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  subject { user }

  describe 'validations' do
    let(:user) { create(:user, :doctor_user, phone: phone) }
    let(:phone) { "065#{Faker::Number.number(digits: 8)}"}

    it 'is valid with correct phone number ' do
      expect(user).to be_valid
      expect(user.phone).to be_present
    end

    it 'is invalid with duplicated phone number' do
      expect(FactoryBot.build(:user, phone: user.phone).save).to be_falsey
    end

    it 'is invalid with short phone number' do
      expect(FactoryBot.build(:user, phone: Faker::Number.number(digits: 8) ).save).to be_falsey
    end

    it 'is invalid with incorect phone number' do
      expect(FactoryBot.build(:user, phone: Faker::Lorem.unique.words ).save).to be_falsey
    end
  end
end
