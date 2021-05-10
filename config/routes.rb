Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'homes#top'
    resources :post_images, only: [:new, :create]
  resources :users, only: [:show, :index, :edit, :update]
end