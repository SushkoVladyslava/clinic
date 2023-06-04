# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { '12345678' }
    phone { "065#{Faker::Number.number(digits: 7)}" }
    city { Faker::Address.city }
    sex { 'woman' }
    description { Faker::Lorem.paragraph }
    email { Faker::Internet.email }
    role { 'patient' }

    trait :doctor_user do
      role { 'doctor' }
      years_of_work { false }
      price { false }
      doctors_category_id { create(:doctors_category ).id }
    end
  end
end
