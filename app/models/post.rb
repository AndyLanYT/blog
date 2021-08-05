class Post < ApplicationRecord
  # belongs_to :user, class_name: "user", foreign_key: "user_id"
  validates :title, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { in: 5..100 }
end
