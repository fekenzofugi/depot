class Product < ApplicationRecord
  validates :title, uniqueness: true
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_or_equal_than: 0.01 }

  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
end
