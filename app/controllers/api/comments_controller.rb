class Api::CommentsController < ApplicationController
    def index
        @trip = Trip.find_by(id: params[:trip_id])

        render json: @trip.comments, status: 200
    end

    def create
        @trip = Trip.find_by(id: params[:id])
        @user = get_current_user
        @comment = @user.comments.build(comment_params)
        @comment.trip = @trip
        if @comment.save
            render json: @comment, status: 201
        else
            render json: { 
                errors: { 
                    messages: @comment.errors.messages 
                } 
            }, status: 422
        end
    end

    def destroy
        @trip = Trip.find_by(id: params[:id])
        @comment = @trip.comments.find_by(id: params[:id])
        @comment.destroy
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end