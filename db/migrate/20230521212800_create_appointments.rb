class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string     :first_name
      t.string     :last_name
      t.integer    :doctor_user_id, null: false
      t.integer    :patient_user_id, null: false
      t.string     :status, default: 'open'
      t.string     :phone
      t.datetime   :schedule_time
      t.string     :message

      t.timestamps
    end
  end
end
