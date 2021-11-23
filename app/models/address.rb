class Address < ApplicationRecord
  belongs_to :user
  belongs_to :state

  validates :suburb, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, presence: true
  validates :unit_address, :postal_code, presence: true
end
