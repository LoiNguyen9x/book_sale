class OrderItemsController < ApplicationController
  before_action :set_order

  def create
    @order_item = @order.order_items.new(order_item_params)
    return session[:order_id] = @order.id if @order.save

    redirect_to products_path, notice: "Order could not be saved. #{@order.errors.full_messages.join(", ")}"
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    if @order_item.update(order_item_params)
      flash[:success] = "Order item updated successfully."
    else
      flash[:error] = "Order item could not be updated. #{@order_item.errors.full_messages.join(", ")}"
    end
    set_order_again
    redirect_to cart_path
  end

  def destroy
    @order_items = @order.order_items
    if @order_items.find(params[:id])&.destroy
      flash[:success] = "The product has been successfully removed from your cart."
    else
      flash[:error] = "Something went wrong. The product could not be removed from your cart."
    end
    redirect_to cart_path
    return set_order_again unless @order_items.empty?

    @order.destroy
    reset_session
  end

  # def destroy
  #   @order_items = @order.order_items
  #   if @order_items.find(params[:id])&.destroy && @order_items.size == 0
  #     @order.destroy
  #     reset_session
  #   end
  # end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

  def set_order
    @order = current_order
  end

  def set_order_again
    @order.update_total
    @order.update_subtotal
    @order.save
  end
end
