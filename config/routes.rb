Rails.application.routes.draw do
  devise_for :users
   resources :items
   resources :items do
    resources :orders, only: [:index, :create]
   end
   resources :orders, only: :index
  root to: 'items#index'
end
