class Api::UserTripsController < ApplicationController
     before_action :set_user_trip, only: [:show, :update, :destroy]

    def index
        @user_trips = UserTrip.where(user_id: params[:user_id])
        render json: @user_trips
    end

    private 

    def set_user_trip
        @user_trip = UserTrip.find_by(id: params[:id])
    end
    
end
