class TripsController < ApplicationController
    before_action :set_params, only: [:edit,:show]

  def index
       @trips = Trips.last(10)
  end

  def my_trips
      @trips = Trips.where(user_id: current_or_guest_user.id)

  end

  def create

      @trip = Trip.new()
      @trip.user_id = current_user.id
      @trip.to = params[:trip][:to]
      @trip.from = params[:trip][:from]
      @trip.date = params[:trip][:date]

      respond_to do |format|
          if @trip.save!
              format.html { redirect_to @trip , notice: 'Trip was successfully created.' }
          else
              format.html { redirect_to travel_index_path , notice: 'Trip was unsuccesfully created.' }

          end
      end

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
