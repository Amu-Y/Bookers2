Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :post_images, only: [:new, :create]
  resources :users, only: [:show, :index, :edit, :update]
  resources :books
  
end