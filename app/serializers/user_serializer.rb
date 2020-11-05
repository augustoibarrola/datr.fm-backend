class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :description, :image_url, :liked_users, :liker_users, :messages_sent, :messages_recieved
  # the attributes take care of displaying what shows 
  # up on localhost:3000/users/


end
