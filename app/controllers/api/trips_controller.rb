class Api::TripsController < ApplicationController

    def index
        trips = Trip.all
        render json: trips, status: 200
    end

    def show
        @trip = Trip.find_by(id: params[:id])
        render json: @trip
    end

    def create
        trip = get_current_user.trips.build(trip_params)
        if trip.save
            render json: trip
        else 
            render json: { message: trip.errors }, status: 400
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
        @trip = Trip.find_by(id: params[:id])
        if @trip.destroy
            render status: 204
        else
            render json: { message: "Unable to remove this comment" }, status: 400
        end
    end

    private

    def trip_params
        params.require(:trip).permit(:name, :description, :location, :img_url )
    end

end
