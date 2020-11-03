class HeartSerializer < ActiveModel::Serializer
    attributes :liker_id, :liked_id
    # the attributes take care of displaying what shows 
    # up on localhost:3000/users/
  end
  