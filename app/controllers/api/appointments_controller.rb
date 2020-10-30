class Api::AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
    render "index.json.jb"
  end

  def create
    @appointment = Appointment.new(
      stylist_id: params[:stylist_id],
      client_id: params[:stylist_id],
      starts_at: params[:starts_at], 
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
      @appointment = params[:starts_at] || @appointment.starts_at
      @appointment = params[:details] || @appointment.details
    )
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
