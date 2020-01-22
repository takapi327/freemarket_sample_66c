Rails.application.routes.draw do
  #deviseのクラスを継承したコントローラを使用させるためにdeviseのルーティングを変更
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root "products#index"
  get 'users/logout', to: 'users#logout'
  get 'users/cardregister', to: 'users#cardregister'
  resources :products, only: [:index, :new, :create, :show, :destroy]
  resources :users, only: [:index, :show, :edit]
  resources :searches, only: [:index]
end
