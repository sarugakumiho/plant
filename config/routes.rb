Rails.application.routes.draw do
  
  devise_for :users
  root to: 'homes#top'
  get '/homes/about' => 'homes#about'
  get '/users/about' => 'users#about'
  get "search" => "searches#search"
  
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
  	get "followings" => "relationships#followings", as: "followings"
  	get "followers" => "relationships#followers", as: "followers"
  end
  
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  
end
