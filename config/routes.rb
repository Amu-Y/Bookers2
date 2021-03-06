Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get 'follower' => 'users#follower'
  get 'followed' => 'users#followed'
  get '/search' => 'search#search'

  resources :users, only: [:show, :index, :edit, :update]

  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end


  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]

end