class Product < ActiveRecord::Base
  has_one :detail, foreign_key: "product_id", class_name: "ProductDetail",
          dependent: :destroy
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.00}
  validates :thumbnail_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  private

    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(base, 'Line Items present')
        return false
      end
    end
end
