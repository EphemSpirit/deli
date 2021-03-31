class Product < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item

  #product properites
  validates :name, :price, :description, presence: true
  has_many :line_items
  has_one_attached :image

  private

    def not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, "Line items present")
        throw :abort
      end
    end
end
