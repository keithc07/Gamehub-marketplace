class Console < ApplicationRecord
    # database relationships
    has_many :listings

    # validates the attribute with different requirements
    validates :console_type, presence: true
end
