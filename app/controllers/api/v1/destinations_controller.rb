class Api::V1::DestinationsController < ApplicationController

  def index
    render json: Destination.all
  end

  def show
    render json: Destination.find(params[:id])
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      render json: @destination, status: 201
    else
      "you are missing require info"
    end
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update(destination_params)
      render json: @destination, status: 200
    else
      "you are missing required info"
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    if @destination.destroy
      render json:  "destination destroyed"
    end
  end


  def destination_params
    params.require(:destination).permit(:name, :description, :image_url, :zip)
  end
end
