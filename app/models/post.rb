class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :elements

  validates :title, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { in: 5..100 }
end
