Rails.application.routes.draw do
  #deviseのクラスを継承したコントローラを使用させるためにdeviseのルーティングを変更
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root "products#index"
end
