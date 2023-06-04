class Appointment < ApplicationRecord

  MAX_NUMBER = 10

  belongs_to :doctor_user, -> {where("role = ?", 'doctor')}, class_name: 'User'
  belongs_to :patient_user, -> {where("role = ?", 'patient')}, class_name: 'User'

  has_one :doctors_recommendation, :dependent => :destroy

  validates :doctor_user, presence: true
  validates :patient_user, presence: true
  validates :schedule_time, presence: true
  validate :appointments_count

  private
  def appointments_count
    if Appointment.where("doctor_user_id = ? AND status = 'open'", self.doctor_user_id).count > MAX_NUMBER
      errors.add(:base, "The doctor already has 10 open records")
    end
  end
end
