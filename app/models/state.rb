class State < ApplicationRecord
    # database relationships
    has_many :addresses

    # validates the attribute with different requirements
    validates :state_name, presence: true
end
