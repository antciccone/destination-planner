class Api::V1::DestinationsController < ApplicationController

  def index
    render json: Destination.all
  end

  def show
    render json: Destination.find(params[:id])
  end

  def create
    require "pry"; binding.pry
    @destination = Destination.new(destination_params)
    if @destination.save
      render json: @destination, status: 201
    else
      "you are missing require info"
    end
  end



  def destination_params
    params.require(:destination).permit(:name, :description, :image_url, :zip)
  end
end
