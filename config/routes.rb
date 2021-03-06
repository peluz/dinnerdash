Rails.application.routes.draw do

  get 'welcome/index'

  get 'sessions/new'


  resources :categories do
  	resources :items
  end
  resources :items
  resources :users
  root 'welcome#index'
  get 'items/:item_id' => 'items#show', as: :show_item
  get 'items/:item_id' => 'items#edit', as: :edit_item1
  get 'items' => 'items#new', as: :new_item1 
  get 'carts/add/:item_id' => 'carts#add', as: :add_cart
  get 'carts/destroy/:item_id' => 'carts#destroy', as: :destroy_cart
  get 'carts/index' => 'carts#index', as: :carts_path
  get 'carts/minus/:item_id' => 'carts#minus', as: :minus_cart
  get    '/login' => 'sessions#new'
  post   '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/buy' => 'orders#create', as: :create_order
  get '/orders' => 'orders#index', as: :orders
  get '/orders/filter/:status' => 'orders#index_by_status', as: :status
  get '/orders/:order_id' => 'orders#show', as: :show_order
  get '/orders/:order_id/edit' => 'orders#edit', as: :edit_order
  patch 'orders/:order_id' => 'orders#update'
  get 'items/:item_id/add/:category_id' => 'items#add', as: :add_category
end
