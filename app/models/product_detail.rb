class ProductDetail < ActiveRecord::Base
  belongs_to :product

  validates :image_url, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  validate :validate_product_id_exists

  private

  def validate_product_id_exists
    errors.add(:product_id, 'produce_id does not exist') unless Product.exists?(self.product_id)
  end
end
