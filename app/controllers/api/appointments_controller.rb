class Api::AppointmentsController < ApplicationController

  before_action :authenticate_user

  def index
    @appointments = current_user.stylist_appointments || current_user.client_appointments
    render "index.json.jb"
  end

  def create
    @appointment = Appointment.new(
      stylist_id: params[:stylist_id],
      client_id: params[:client_id],
      starts_at: DateTime.new(params[:year].to_i, params[:month].to_i, params[:day].to_i, params[:hour].to_i, params[:minute].to_i, 0), 
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
    appointment = Appointment.find(params[:id])
    appointment.destroy
    render json: {message: "The appointment has been deleted!"}
  end
end
