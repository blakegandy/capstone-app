class Api::AppointmentsController < ApplicationController

  before_action :authenticate_user

  def index
    if current_user.stylist
      @appointments = current_user.client_appointments
    else
      @appointments = current_user.stylist_appointments
    end
    render "index.json.jb"
  end

  def create
    @appointment = Appointment.new(
      stylist_id: params[:stylist_id],
      client_id: current_user.id,
      starts_at: params[:starts_at],
      # starts_at: DateTime.new(params[:year].to_i, params[:month].to_i, params[:day].to_i, params[:hour].to_i, params[:minute].to_i, 0), 
      details: params[:details] 
    )
    if @appointment.save
      render "show.json.jb"
    else
      render json: {errors: @appointment.errors.full_messages}
    end
  end 

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.starts_at = params[:starts_at] || @appointment.starts_at
    @appointment.details = params[:details] || @appointment.details

    if @appointment.save
      render "show.json.jb"
    else
      render json: {errors: @appointment.errors.full_messages}
    end
  end

  def destroy
    appointment = current_user.appointments.find(params[:id])
    appointment.destroy
    render json: {message: "The appointment has been deleted!"}
  end
end
