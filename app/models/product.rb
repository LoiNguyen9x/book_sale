class Product < ApplicationRecord
  belongs_to :category
  # belongs_to :user
  has_many :order_items
  validates :title, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 }
  validates :price, presence: true
  has_one_attached :image
  validates :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  scope :recently_ordered, -> { joins(:order_items).where("order_items.created_at > ?", 3.months.ago).distinct.group("products.id").order("SUM(order_items.quantity) DESC") }

  def display_image
    self.image.variant(resize: "150 x 150")
  end
end
