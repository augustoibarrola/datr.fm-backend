class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :description
  # the attributes take care of displaying what shows 
  # up on localhost:3000/users/
end
