Rails.application.routes.draw do
  resources :categories do
  	resources :items
  end
  resources :users
  resources :items
  root 'categories#index'
  get 'carts/add/:item_id' => 'carts#add', as: :add_cart
  get 'carts/destroy/:item_id' => 'carts#destroy', as: :destroy_cart
  get 'carts/index' => 'carts#index', as: :carts_path
  get 'carts/minus/:item_id' => 'carts#minus', as: :minus_cart

end
