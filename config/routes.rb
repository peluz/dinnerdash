Rails.application.routes.draw do
  resources :categories do
  	resources :items
  end
  resources :items
  root 'categories#index'
  get 'carts/add/:item_id' => 'carts#add', as: :add_cart
  get 'carts/destroy/:item_id' => 'carts#destroy', as: :destroy_cart
  get 'carts/index' => 'carts#index', as: :carts_path
end
