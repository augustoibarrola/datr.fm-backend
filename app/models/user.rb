class User < ApplicationRecord
    # the "liker" User has_many "liked" users 
    has_many :liked_users, foreign_key: :liker_id, class_name: 'Heart'
    has_many :likeds, through: :liked_users

    # the "liked" User has_many "liker" users 
    has_many :liker_users, foreign_key: :liked_id, class_name: 'Heart'
    has_many :likers, through: :liker_users

end
