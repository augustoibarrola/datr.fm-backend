class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :description, :image_url
  # the attributes take care of displaying what shows 
  # up on localhost:3000/users/

  def likers
    ActiveModel::SerializableResource.new(object.likers, 
    each_serializer: HeartSerializer)
  end
end
