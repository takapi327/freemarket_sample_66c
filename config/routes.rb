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
  get 'users/logout' => 'users#logout'
  get 'users/cardregister' => 'users#cardregister'
  resources :products, only: [:index, :new, :create, :show]
  resources :users, only: [:index, :show, :edit, :new]
end
