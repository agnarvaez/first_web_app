Rails.application.routes.draw do
  resources :books
  resources :categories
  resources :authors
  root 'books#index'
end
