class User < ApplicationRecord
    has_many :liked_users 
    has_many :users, through => :liked_users
end
