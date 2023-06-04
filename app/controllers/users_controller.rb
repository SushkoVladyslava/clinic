class UsersController < ApplicationController
  def index
    @users = User.patient.all
  end

  def show
    if params[:id]
      @user = User.patient.find(params[:id])
    else
      @user = current_user
    end
    @user_appointments = @user.patient_user_appointments
  end
end