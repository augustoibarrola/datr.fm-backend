class MessageSerializer < ActiveModel::Serializer
    attributes :id, :sender_id, :recipient_id, :message_body
    # the attributes take care of displaying what shows 
    # up on localhost:3000/users/
  end
  