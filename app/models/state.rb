class State < ApplicationRecord
    has_many :users

    validates :state_name, presence: true
end
