class HeartsController < ApplicationController

    def index 
        hearts = Heart.all
        render json: hearts
    end

end