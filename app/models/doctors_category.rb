class DoctorsCategory < ApplicationRecord
  has_many :doctor_user, -> {where("role = ?", 'doctor')}, class_name: 'User'

  validates :name, presence: true, uniqueness: true
end