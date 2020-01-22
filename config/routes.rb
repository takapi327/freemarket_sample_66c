Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"
  post 'pay', to: 'purchase#pay'
  get 'done', to: 'purchase#done'

  resources :cards, only: [:new, :show] do
    collection do
      post 'make', to: 'cards#make'
      post 'delete', to: 'cards#delete'
    end
  end

  resources :purchase, only: [:new] do
    member do
      get 'index', to: 'purchase#index'
      # post 'pay', to: 'purchase#pay'
      # get 'done', to: 'purchase#done'
    end
  end

  resources :products, only: [:index, :new, :show] do
    member do
      get 'buy', to: 'products#buy'
    end
  end

  resources :users, only: [:index, :show, :edit]
end