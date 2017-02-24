class Item < ApplicationRecord
  validates :name, :description, :price, :img_url , presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1 }
  validates :img_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
end
