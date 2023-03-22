class ApplicationController < ActionController::Base
  helper_method :current_order
  # to call anywhere
  def current_order
    return Order.find(session[:order_id]) if session[:order_id]

    Order.new
  end
  # def current_order
  #   @current_order ||= Order.find_by(id: session[:order_id]) || Order.new
  # end
end
