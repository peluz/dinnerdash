Rails.application.routes.draw do
  resources :categories do
  	resources :items
  end
  resources :items
  root 'categories#index'
  get 'carts/add/:item_id' => 'carts#add', as: :add_cart
end
