class ProductSearchService
  def initialize(search_params)
    @search_term = search_params[:search]
    @price_from = search_params[:price_from]
    @price_to = search_params[:price_to]
    @category_id = search_params[:category_id]
  end

  def perform
    products = Product.all.order(id: :desc)
    #search filter by name or description
    search_term = "%#{@search_term}%"
    products = products.where("LOWER(title) LIKE LOWER(?) OR LOWER(description) LIKE LOWER(?)", search_term, search_term) if @search_term.present?
    #search filter by price range
    if @price_from.present? && @price_to.present?
      products = products.where("price >= ? AND price <= ?", @price_from, @price_to)
    elsif @price_from.present?
      products = products.where("price >= ?", @price_from)
    elsif @price_to.present?
      products = products.where("price <= ?", @price_to)
    end
    #search filter by category
    products = products.where(category_id: @category_id) if @category_id.present?
    products
  end
end
