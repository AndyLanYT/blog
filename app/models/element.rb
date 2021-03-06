class Element < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :element_type, inclusion: { in: %w[paragraph image] }

  has_rich_text :content
  has_one_attached :image

  def paragraph?
    element_type == 'paragraph'
  end

  def image?
    element_type == 'image'
  end
end
