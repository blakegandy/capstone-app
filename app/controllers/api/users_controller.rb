class Api::UsersController < ApplicationController

  before_action :authenticate_user, except: [:create, :index, :show]

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
    @users = User.where(stylist: true)
    render "index.json.jb"
  end

  def show
    @user = User.find(params[:id])
    render "show.json.jb"
  end

  def update
    @user = current_user
    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.email = params[:email] || @user.email
    @user.phone_number = params[:phone_number] || @user.phone_number
    if params[:password]
      @user.password = params[:password] 
      @user.password_confirmation = params[:password_confirmation]
    end
    @user.salon = params[:salon] || @user.salon
    @user.image_url = params[:image_url] || @user.image_url
    @user.specialty = params[:specialty] || @user.specialty
    if @user.save
      render "show.json.jb"
    else
      render json: {errors: @user.errors.full_messages}, status: 422
    end
  end

  def destroy
    user = current_user
    user.destroy
    render json: {message: "The user has been deleted!"}
  end
end
