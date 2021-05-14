Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :homes, only: [:index]
  resources :users, only: [:show, :index, :edit, :update]
  resources :books

end