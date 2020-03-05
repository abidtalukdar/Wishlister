Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:new, :create, :user]
  resources :login, only: [:new, :create]
  delete "logout", to: "login#destroy", as: "log_out"
  
  resources :wishlists, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :wishlist_items, only: [:create, :destroy]
  resources :items, only: [:index, :show]

end
