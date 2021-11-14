class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  validates :phone_number, numericality: { only_integer: true, message: "only allows integers"}, length: { is: 9, message: "require 9 digits" }, presence: true
  validates :first_name, :last_name, :suburb, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, presence: true
  validates :unit_address, :postal_code, presence: true

  validates :state, length: { in: 2..3 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows 2-3 letters" }, presence: true

  has_many :listings
  has_many :buys
end
