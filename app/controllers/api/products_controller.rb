class Api::ProductsController < ApplicationController

  before_action :authenticate_user

  def show
    @product = Product.find(params[:id])
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      id: params[:id],
      user_id: current_user.id,
      name: params[:name],
      description: params[:description],
      quantity: params[:quantity],
      price: params[:price],
      image_url: params[:image_url]
    )
    if @product.save
      render "show.json.jb"
    else
      render json: {errors: @product.errors.full_messages}
    end
  end

  def update
    @product = current_user.products.find(params[:id])
    @product.name = params[:name] || @product.name
    @product.description = params[:description] || @product/description
    @product.price = params[:price] || @product.price
    @product.quantity = params[:stock] || @product.quantity
    @product.image_url = params[:image_url] || @product.image_url

    if @product.save
      render "show.json.jb"
    else
      render json: {errors: @product.errors.full_messages}
    end
  end

  def destroy
    product = current_user.products.find(params[:id])
    product.destroy
    render json: {message: "The item has been deleted!"}
  end
end
