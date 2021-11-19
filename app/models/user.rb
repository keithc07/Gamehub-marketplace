class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  # validates the attributes with different requirements
  validates :phone_number, numericality: { only_integer: true, message: "only allows integers"}, length: { is: 9, message: "require 9 digits" }, presence: true
  validates :first_name, :last_name, :suburb, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, presence: true
  validates :unit_address, :postal_code, presence: true

  # database relationships
  has_many :listings, dependent: :destroy
  belongs_to :state

  # gem "Pundit" logic 
  def admin?; false; end
end
