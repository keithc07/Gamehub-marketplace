class Listing < ApplicationRecord
  # database relationships
  belongs_to :user
  belongs_to :console
  has_one_attached :picture, dependent: :destroy

  # validates the attributes with different requirements
  validates :listing_title, length: { in: 10..100, message: "should be within 10 to 100 characters"}, presence: true
  validates :description, length: { in: 20..5000, message: "should be within 20 to 5000 characters" }, presence: true
  validates :price, :picture, presence: true

  # Search scope that set up the searching target
  scope :search_by_listing_title, -> (listing_title) {where('listing_title ILIKE ?', "%#{listing_title}%")}
  scope :filter_by_console, -> (id) {where(console_id: id)}

  # Search method
  def self.search(search_hash)
    if search_hash
      Listing.search_by_listing_title(search_hash["listing_title"]).filter_by_console(search_hash["console_id"])
    else
      Listing.all
    end
  end
end

