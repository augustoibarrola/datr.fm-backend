class Message < ApplicationRecord
    belongs_to :sender, class_name: 'User'
    belongs_to :recipient, class_name: 'User'
    accepts_nested_attributes_for :sender, allow_destroy: false
    accepts_nested_attributes_for :recipient, allow_destroy: false



end
