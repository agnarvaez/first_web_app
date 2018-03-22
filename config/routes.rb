Rails.application.routes.draw do
  resources :books
  resources :categories
  resources :authors
  resources :publishers
  root 'books#index'
end
