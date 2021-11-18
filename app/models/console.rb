class Console < ApplicationRecord
    # database relationships
    has_many :listings

    validates :console_type, presence: true
end
