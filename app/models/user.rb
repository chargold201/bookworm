class User < ApplicationRecord
  has_many :reviews
  has_many :comments
  has_many :books, through: :reviews

  has_secure_password
end
