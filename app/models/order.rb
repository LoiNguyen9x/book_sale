class Order < ApplicationRecord
  has_many :order_items
  before_save :update_subtotal, :update_total
  # tong tien
  def subtotal
    order_items.includes(:product).collect { |item| item.valid? ? (item.quantity * item.unit_price) : 0 }.sum
  end

  def total
    order_items.includes(:product).collect { |item| item.valid? ? item.quantity : 0 }.sum
  end

  # private

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def update_total
    self[:total] = total
  end
end
