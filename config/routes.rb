Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:index, :show, :edit]
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]
end
