class User < ApplicationRecord

    has_secure_password
    
    validates :username, presence: true 
    # validates :password, presence: true 

    has_many :liked_users, foreign_key: :liker_id, class_name: 'Heart'
    # has_many :likeds, through: :liked_users
    accepts_nested_attributes_for :liked_users, allow_destroy: true

    has_many :liker_users, foreign_key: :liked_id, class_name: 'Heart'
    # has_many :likers, through: :liker_users
    accepts_nested_attributes_for :liker_users, allow_destroy: false

    has_many :messages_sent, foreign_key: :sender_id, class_name: 'Message'
    # has_many :sent_messages, through: :messaged_users
    accepts_nested_attributes_for :messages_sent, allow_destroy: true

    has_many :messages_recieved, foreign_key: :recipient_id, class_name: 'Message'
    # has_many :messages_recieved, through: :recieved_messages
    accepts_nested_attributes_for :messages_recieved, allow_destroy: true



    def send_message
        return "message sent"
    end

    def total_likes
        self.likers
    end

    def unique_likers 
        self.likers.uniq
    end
end