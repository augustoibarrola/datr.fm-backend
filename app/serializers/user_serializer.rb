class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :username, :lastfm_username, :spotify_username, :description, :email, :image_url, :liked_users, :liker_users, :messages_sent, :messages_recieved, :albums
  # the attributes take care of displaying what shows 
  # up on localhost:3000/users/


  # def messages_sent
  #   ActiveModel::SerializableResource.new( object.messages_sent,
  #    each_serializer: MessageSerializer)
  # end


end
