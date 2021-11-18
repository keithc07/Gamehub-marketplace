class Listing < ApplicationRecord
  # database relationships
  belongs_to :user
  belongs_to :console
  has_one_attached :picture

  # validates the attributes with different requirements
  validates :listing_title, length: { in: 10..100, message: "Listing title should be within 10 to 100 characters"}, presence: true
  validates :description, length: { in: 50..5000, message: "Description should be within 100 to 5000 characters" }, presence: true
  validates :price, :picture, presence: true
end
