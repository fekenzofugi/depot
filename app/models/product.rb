class Product < ApplicationRecord

  # If we have lots of carts, each product might have many line items referencing it.
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, uniqueness: true
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_or_equal_than: 0.01 }

  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  private
  
    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end
end
