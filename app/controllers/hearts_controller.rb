class HeartsController < ApplicationController
    skip_before_action :authorized, only: [:create]
    before_action :set_heart, only: [:destroy]


    def index 
        hearts = Heart.all
        render json: { hears: hearts }
    end

    def create

        @heart = Heart.create(liker_id: params[:liker_id], liked_id: params[:liked_id])
        # @heart = Heart.create(heart_params)
        if @heart.save
            render json: { heart: @heart, message: "new like!"}
        end
    end

    def destroy 
        @heart.destroy
    end

    private 

    def set_heart
        @heart = Heart.find(params[:id])
    end

    def  
        params.require(:heart).permit(:liker_id, :liked_id)
    end


end