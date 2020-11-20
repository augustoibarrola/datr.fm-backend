class MessagesController < ApplicationController

    def index 
        messages = Message.all 
        render json: messages.to_json(:include => {
            :sender => {:only => [:name, :username, :email]}, 
            :recipient => {:only => [:name, :username, :email]}
        })
    end

    def show 
        message = Message.where(sender_id: params[:id])
        render json: message.to_json(:include => {
            :sender => {:only => [:name, :username, :email]}, 
            :recipient => {:only => [:name, :username, :email]}
        })
    end

    # def show_total_recieved
    #     @messages = Messages.where(recipient_id: params[:id])
    #     render json: @messages.json(:include => {
    #         :sender => {:only => [:name, :username, :email]}, 
    #         :recipient => {:only => [:name, :username, :email]},
    #         :message_body
    #     })
    # end

    def create 
        new_message = Message.new(message_params)
        if new_message.save
            render json: { new_message: new_message, message: "new message created!", recipient: new_message.recipient, sender: new_message.sender }
        else
            render json: new_message.errors
        end
    end

    private 

    def message_params 
        params.require(:message).permit(:sender_id, :recipient_id, :message_body)
    end
end
