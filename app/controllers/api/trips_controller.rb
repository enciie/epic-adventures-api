class Api::TripsController < ApplicationController

    def index
        @trips = Trip.all
        render json: @trips, status: 200
    end

    def show
        @trip = Trip.find_by(id: params[:id])
        render json: @trip
    end

    def create
        @user = get_current_user
        @trip = Trip.new(trip_params)
        @trip.user_id = @user.id
        if @trip.save

            # @user_trip = UserTrip.create(trip_id: @trip.id, user_id: @user.id )
            render json: @trip
        else
            render json: { message: @trip.errors }, status: 400
        end
    end

    def update
        @trip = Trip.find_by(id: params[:id])
        if @trip.update(trip_params)
            render json: @trip
        else
            render json: { message: @trip.errors }, status: 400
        end
    end

    def destroy
        @trip = Trip.find(params[:id])
        # @user_trip = UserTrip.find_by(trip_id: @trip.id)

        # if @trip.destroy && @user_trip.destroy
        if @trip.destroy
            render json: @trip, status: 204
        else
            render json: { message: "Unable to remove this trip" }, status: 400
        end
    end

    private

    def trip_params
        params.require(:trip).permit(:name, :description, :location, :img_url )
    end

end
