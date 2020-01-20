Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "cards#show"
  post 'products', to: 'products#buy'
  # post 'cards', to: 'cards#pay'

  resources :cards, only: [:new, :show] do
    collection do
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end

  resources :products, only: [:index, :new, :show]
  resources :users, only: [:index, :show, :edit]
end