class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  # before_action :search, only: [:index]

  # # GET /products or /products.json
  def index
    @pop_products = Product.recently_ordered.limit(Settings.limit).paginate(page: params[:page], per_page: Settings.per_page_min)
    @categories = Category.all
    @order_item = current_order.order_items.new
    #search using ProductSearchService by perform
    @products = ProductSearchService.new(search_params).perform.paginate(page: params[:page], per_page: Settings.per_page_max)
    flash.now[:notice] = "Product is not found" if @products.empty?
  end

  # GET /products/1 or /products/1.json
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  def search_params
    params.permit(:search, :price_from, :price_to, :category_id, :commit)
  end

  def product_params
    params.require(:product).permit(:category_id, :title, :price, :thumbnail, :description, :image, :search, :price_from, :price_to, :category_id)
  end
end
