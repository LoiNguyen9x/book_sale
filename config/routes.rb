Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :products, only: [:index, :show, :search]
  match "/admin/coupons/showcoupons" => "admin/coupons#showcoupons", via: :get, as: "admin_coupons_showcoupons"

  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end

  as :product do
    delete "products/:id" => "products#destroy"
  end
  root to: "products#index"
  get "/help", to: "detail_pages#help"
  get "/about", to: "detail_pages#about"
  get "/contact", to: "detail_pages#contact"
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  get "/search", to: "products#search"
  post "/search", to: "products#search"
  resources :searches
end
