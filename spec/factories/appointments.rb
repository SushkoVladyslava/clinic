# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    doctor_user { create(:user, :doctor_user) }
    patient_user { create(:user)}
    status { 'open' }
    phone { "065#{Faker::Number.number(digits: 7)}" }
    schedule_time { 4.days.since }
    message { Faker::Lorem.paragraph }

    trait :invalid_appointment do
      doctor_user { nil }
    end
  end
end
