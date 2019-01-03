class Api::CommentsController < ApplicationController
    def index
        @trip = Trip.find_by(id: params[:trip_id])
        @comments = @trip.comments.all 

        render json: @comments, status: 200
    end

    def create
        @trip = Trip.find(params[:trip_id].to_i)
        @comment = get_current_user.comments.build(comment_params)
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
        @comment = Comment.find(params[:id])
        @comment.destroy

        render json: @comment
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :trip_id)
    end
end