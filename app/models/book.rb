class Book < ApplicationRecord
  belongs_to :genre
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews

  validates_presence_of [:title, :author, :isbn]
  validates :isbn, numericality: { only_integer: true }, uniqueness: true

  def self.by_genre(genre_id)
    where(genre: genre_id)
  end
end
