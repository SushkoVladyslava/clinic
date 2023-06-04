class Appointment < ApplicationRecord

  belongs_to :doctor_user, -> {where("role = ?", 'doctor')}, class_name: 'User'
  belongs_to :patient_user, -> {where("role = ?", 'patient')}, class_name: 'User'

  has_one :doctors_recommendation

  validates :doctor_user, presence: true
  validates :patient_user, presence: true
  validate :appointments_count

  private
  def appointments_count
    if Appointment.where("doctor_user_id = ? AND status = 'open'", self.doctor_user_id).count > 4
      errors.add(:base, "The doctor already has 10 open records")
    end
  end
end
