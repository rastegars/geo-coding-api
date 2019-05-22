class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :update, :destroy]

  # GET /places
  def index
    @places = Place.all

    render json: @places
  end

  # GET /places/1
  def show
    render json: @place
  end

  # POST /places
  def create
    @place = Place.new(place_params)

    if @place.save
      render json: @place, status: :created, location: @place
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /places/1
  def update
    if @place.update(place_params)
      render json: @place
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # DELETE /places/1
  def destroy
    @place.destroy
  end

  def search
    Geocoder.configure(always_raise: [SocketError, Timeout::Error])
    results = Geocoder.search(params[:prefix])
    render json: results, status: :ok
  rescue SocketError
    render json: { message: 'Connection Timeout' }, status: :request_timeout
  end

  def reverse_search
    Geocoder.configure(always_raise: [SocketError, Timeout::Error])
    results = Geocoder.search([params[:lat], params[:lon]])
    render json: results, status: :ok
  rescue SocketError
    render json: { message: 'Connection Timeout' }, status: :request_timeout
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def place_params
      params.require(:place).permit(:location, :lat, :lon)
    end
end
