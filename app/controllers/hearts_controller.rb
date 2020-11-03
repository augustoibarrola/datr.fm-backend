class HeartsController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index 
        hearts = Heart.all
        render json: { hears: hearts }
    end

    def create 
        @heart = Heart.create(liker_id: params[:liker_id], liked_id: params[:liked_id])

        if @heart.save
            render json: { heart: @heart, message: "new like!"}

        end
    end

    private 

    def heart_params 
        params.require(:heart).permit(:liker_id, :liked_id)
    end

end