class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :comments

  validates_presence_of [:title, :content]
end
