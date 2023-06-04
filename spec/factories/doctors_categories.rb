# frozen_string_literal: true

FactoryBot.define do
  factory :doctors_category do
    name { Faker::Lorem.unique.words }
  end
end
