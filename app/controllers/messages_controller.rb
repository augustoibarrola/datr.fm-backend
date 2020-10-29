class MessagesController < ApplicationController

    def index 
        messages = Message.all 
        render json: messages.to_json(:include => {
            :sender => {:only => [:name, :username, :email]}, 
            :recipient => {:only => [:name, :username, :email]}
        })
    end

    def show 
        message = Message.find_by(id: params[:id])
        render json: message.to_json(:include => {
            :sender => {:only => [:name, :username, :email]}, 
            :recipient => {:only => [:name, :username, :email]}
        })
    end

    private 

    def message_params 
        params.require(:message).permit(:message_body)
    end
end
