class Book < ApplicationRecord
  belongs_to :genre
  has_many :reviews
  has_many :users, through: :reviews

  validates_presence_of [:title, :author, :isbn]
  validates_uniqueness_of :isbn
end
