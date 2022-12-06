Rails.application.routes.draw do
  devise_for :users
   resources :items, only: [:index, :new, :create, :show, :edit, :destroy,:update ]
  root to: 'items#index'
end
