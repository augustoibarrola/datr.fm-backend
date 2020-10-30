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

    def create 
        message = Message.new(message_params)
        if message.save
            render json: message
        else
            render json: message.errors
        end
    end

    private 

    def message_params 
        params.require(:message).permit(:sender_id, :recipient_id, :message_body)
    end
end
