class TravelController < ApplicationController
    before_action :set_params, only: [:edit,:show]
    before_action :create_trip, only: [:index]
def index
    
end

  def create
      @trip= Trip.new(trip_params)


  end
  def show

  end

  private

  def set_params
      @trip = Trip.find(params[:id])
  end
  def create_trip
      @trip = Trip.new()
  end
  def trip_params
     params.require(:trip).permit(:to,:from,:date)
  end
end
