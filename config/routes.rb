Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#buy"
  resources :products, only: [:index, :new, :show]
  resources :users, only: [:index, :show, :edit]
end
