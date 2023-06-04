class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:phone]

  ROLES = %w[admin patient doctor].freeze

  has_one_attached :avatar
  has_many :doctor_user_appointments, class_name: 'Appointment', foreign_key: 'doctor_user_id', dependent: :destroy
  has_many :patient_user_appointments, class_name: 'Appointment', foreign_key: 'patient_user_id', dependent: :destroy

  before_save :assign_role

  validates :doctors_category_id, presence: true, if: ->(user) { user.doctor? }
  validates :first_name, presence: true, if: ->(user) { user.doctor? }
  validates :last_name, presence: true, if: ->(user) { user.doctor? }
  validates :phone,   :presence => {:message => 'phone number is duplicated or not valid'},
            :numericality => true,
            :length => { :minimum => 10, :maximum => 12 },
            uniqueness: true

  scope :doctor,  -> { where(role: 'doctor') }
  scope :patient, -> { where(role: 'patient') }
  scope :admin,   -> { where(role: 'admin') }

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def doctor?
    role == 'doctor'
  end

  def assign_role
    self.role = 'patient' if role.nil?
  end
end
