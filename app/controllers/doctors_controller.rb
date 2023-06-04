class DoctorsController < ApplicationController
  def index
    if params['doctors_category'].blank? or params['doctors_category']['id'].blank?
      @doctors = User.doctor.all
    else
      @category = DoctorsCategory.find(params[:doctors_category][:id])
      @doctors = @category.doctor_user
    end

    @appointments = current_user.doctor_user_appointments
  end

  def show
    if params[:id]
      @doctor = User.doctor.find(params[:id])
    else
      @doctor = current_user
    end
  end
end