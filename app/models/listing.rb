class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :console

  validates :listing_title, length: { in: 20..100, message: "Listing title should be within 20 to 100 characters"}, presence: true
  validates :description, length: { in: 100..5000, message: "Description should be within 100 to 5000 characters" }, presence: true
  validates :price, presence: true
end
