Rails.application.routes.draw do
  devise_for :users
  resources :users do
  	member do
  		get :following, :followers
  	end
  end
  resources :relationships,		only: [:create, :destroy]
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resource :post_comments, only: [:create, :destroy]
  end
  root 'home#top' 
  get 'home/about' => 'home#about'

  get 'search/index' =>'search#index'

  resources :maps, only: [:index]
  get '/map_request', to: 'maps#map', as: 'map_request'
end

