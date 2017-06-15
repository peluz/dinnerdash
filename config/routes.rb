Rails.application.routes.draw do
  resources :categories do
  	resources :items
  end
  resources :items
  root 'categories#index'
end
