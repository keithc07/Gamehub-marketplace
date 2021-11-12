class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  validates :first_name, :last_name, :phone_number, :unit_address, :suburb, :postal_code, :state, presence: true
  has_many :posts
  has_many :buys
end
