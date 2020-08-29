class User < ApplicationRecord
  has_many :reviews
  has_many :comments
  has_many :books, through: :reviews

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true

  has_secure_password
end
