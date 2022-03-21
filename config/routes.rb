Rails.application.routes.draw do


  root to: "homes#top"
  get "homes/about" => "homes#about", as:"about"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :show, :index, :destroy, :edit]
  resources :user, only: [:show, :edit]
end
