class Api::UsersController < ApplicationController
  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      stylist: params[:stylist],
      salon: params[:salon],
      image_url: params[:image_url],
      specialty: params[:specialty]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def index
    @users = User.all
    render "index.json.jb"
  end

  def show
    @user = User.find(params[:id])
    render "show.json.jb"
  end

  def update
    @user = User.find(params[:id])
    @user = params[:first_name] || @user.first_name
    @user = params[:last_name] || @user.last_name
    @user = params[:email] || @user.email
    @user = params[:phone_number] || @user.phone_number
    @user = params[:password] || @user.password
    @user = params[:password_confirmation] || @user.password_confirmation
    @user = params[:salon] || @user.salon
    @user = params[:image_url] || @user.image_url
    @user = params[:specialty] || @user.specialty
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {message: "The user has been deleted!"}
  end
end
