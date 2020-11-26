class User < ApplicationRecord

    has_secure_password
    
    validates :username, presence: true 
    # validates :password, presence: true 

    has_many :albums
    has_many :tracks

    has_many :liked_users, foreign_key: :liker_id, class_name: 'Heart'
    # has_many :likeds, through: :liked_users
    accepts_nested_attributes_for :liked_users, allow_destroy: true

    has_many :liker_users, foreign_key: :liked_id, class_name: 'Heart'
    # has_many :likers, through: :liker_users
    accepts_nested_attributes_for :liker_users, allow_destroy: false

    has_many :messages_sent, class_name: 'Message', 
                             foreign_key: :sender_id
    # has_many :sent_messages, through: :messaged_users
    accepts_nested_attributes_for :messages_sent, allow_destroy: true

    has_many :messages_recieved, class_name: 'Message', 
                                 foreign_key: :recipient_id
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



# class Employee < ApplicationRecord
#     has_many :subordinates, class_name: "Employee", =>> the employee class has_many subordinates, who themselves are instances of the class "Employee"
#                             foreign_key: "manager_id" =>> the referent key to which these instances of the employee class that have_many instances of the other emplpyee class instances is "manager_id"
   
#     belongs_to :manager, class_name: "Employee", optional: true =>> an employee belongs_to a manager instance (above), but this is only optionally true. an employee can also NOT belong to a manager. 
#   end

