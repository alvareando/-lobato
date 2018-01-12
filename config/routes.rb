Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:new, :create] do
    resources :booking, only: [:new, :create]
  end
  resources :menus, only: [:new, :create] do
    resources :dishes, only: [:new, :create]
  end
  get '/dashboard', to: 'pages#dashboard'
end
