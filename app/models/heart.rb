class Heart < ApplicationRecord
    belongs_to :liker, class_name: 'User'
    belongs_to :liked, class_name: 'User'
end

# liker and liked refer to the User class both, and both also have
# counterparts in the Hearts table, liker_id and liked_id
