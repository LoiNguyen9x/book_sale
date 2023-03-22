class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items.includes(:product)
    # n+1 query
  end
end
