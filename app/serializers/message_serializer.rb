class MessageSerializer < ActiveModel::Serializer
    attributes :id, :sender_id, :recipient_id, :message_body, :sender
    # the attributes take care of displaying what shows 
    # up on localhost:3000/users/

    def sender 
        
    end

  end
#   def messages_sent
#     ActiveModel::SerializableResource.new( object.messages_sent,
#      each_serializer: MessageSerializer)
#   end