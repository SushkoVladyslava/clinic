class AppointmentsController  < ApplicationController
  def index
    @appointments = current_user.doctor_user_appointments
    @user_appointments = current_user.patient_user_appointments
  end

  def show
    @appointment = Appointment.find(params[:id])
    @recommendation = @appointment.doctors_recommendation
  end

  def new
    @appointment = current_user.patient_user_appointments.new
  end

  def create
    @appointment = current_user.patient_user_appointments.build(appointment_params)
    if @appointment.save
      redirect_to my_appointment_path, success: 'Appointments successfully added'
    else
      render :new, danger: 'Appointments didnt create'
    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(:first_name, :last_name, :doctor_user_id, :patient_user_id, :status, :phone,
                                        :schedule_time, :message)
  end
end