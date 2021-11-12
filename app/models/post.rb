class Post < ApplicationRecord
  belongs_to :user
  belongs_to :console

  has_many :buys
end
