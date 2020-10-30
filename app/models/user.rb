class User < ApplicationRecord

    has_secure_password
    validates :username, presence: true 
    # validates :password, presence: true 

    has_many :liked_users, foreign_key: :liker_id, class_name: 'Heart'
    has_many :likeds, through: :liked_users

    has_many :liker_users, foreign_key: :liked_id, class_name: 'Heart'
    has_many :likers, through: :liker_users

    has_many :messaged_users, foreign_key: :sender_id, class_name: 'Message'
    has_many :sent_messages, through: :messaged_users

    has_many :recieved_messages, foreign_key: :recipient_id, class_name: 'Message'
    has_many :messages_recieved, through: :recieved_messages



    def send_message
        return "message sent"
    end
end