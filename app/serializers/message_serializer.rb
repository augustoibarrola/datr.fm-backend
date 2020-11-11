class MessageSerializer < ActiveModel::Serializer
    attributes :id, :sender, :recipient, :message_body, :sender
    # the attributes take care of displaying what shows 
    # up on localhost:3000/users/


  end
#   def messages_sent
#     ActiveModel::SerializableResource.new( object.messages_sent,
#      each_serializer: MessageSerializer)
#   end