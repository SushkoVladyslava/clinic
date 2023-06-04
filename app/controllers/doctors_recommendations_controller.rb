class DoctorsRecommendationsController < ApplicationController
  before_action :set_appointment, only: %i[ create new edit update]

  def index
    @recommendations = DoctorsRecommendation.all
  end

  def show
    @recommendation = DoctorsRecommendation.find(params[:id])
    @d_recommendation = @appointment.doctors_recommendation.build
  end

  def new
    @recommendation = DoctorsRecommendation.new
  end

  def create
    @recommendation = @appointment.build_doctors_recommendation(recommendation_params)
    if @recommendation.save
      @appointment.update(status: 'closed')
      redirect_to appointments_path, success: 'recommendation successfully added'
    else
      render :new, danger: 'recommendation didnt create'
    end
  end

  def edit
    @recommendation = DoctorsRecommendation.find(params[:id])
  end

  def update
    @recommendation = DoctorsRecommendation.find(params[:id])
    if @recommendation.update(recommendation_params)
      redirect_to appointments_path, success: 'recommendation successfully added'
    else
      render :new, danger: 'recommendation didnt create'
    end
  end

  private
  def recommendation_params
    params.require(:doctors_recommendation).permit(:name, :description, :appointment_id)
  end

  def set_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end
end