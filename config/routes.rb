Rails.application.routes.draw do
  #deviseのクラスを継承したコントローラを使用させるためにdeviseのルーティングを変更
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'user_details', to: 'users/registrations#new_cellphone'
    post 'user_details', to: 'users/registrations#create_tel'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'complete_registrations', to: 'users/registrations#complete_registration'
  end
  root "products#index"

  resources :products, only: [:index, :new, :create, :show]
  resources :users, only: [:index, :show, :edit, :new]
  get 'users/logout', to: 'users#logout'
  get 'users/cardregister', to: 'users#cardregister'

  resources :products, only: [:index, :new, :create, :show, :destroy, :edit] do
    member do
      get 'buy', to: 'products#buy'
    end
  end
  
  resources :users, only: [:index, :show, :edit]
  
  resources :searches, only: [:index]
  
  resources :cards, only: [:new, :show] do
    collection do
      post 'make', to: 'cards#make'
      post 'delete', to: 'cards#delete'
    end
  end

  resources :purchase, only: [:new] do
    member do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end

end
