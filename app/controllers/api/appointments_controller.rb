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
end
