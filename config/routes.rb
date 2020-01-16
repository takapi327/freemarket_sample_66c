Rails.application.routes.draw do
  #deviseのクラスを継承したコントローラを使用させるためにdeviseのルーティングを変更
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root "products#index"
  get 'users/logout' => 'users#logout'
  get 'users/cardregister' => 'users#cardregister'
  resources :products, only: [:index, :new, :create, :show]
  resources :users, only: [:index, :show, :edit]
end
