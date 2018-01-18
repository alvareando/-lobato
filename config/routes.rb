Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :restaurants, only: [:new, :create] do
    resources :bookings, only: [:new, :create]
    resources :simple_bookings, only: [:new, :create, :show]

  end

  #resources :booking_participations, only: [:new, :create]

  resources :menus, only: [:new, :create] do
    resources :dishes, only: [:new, :create]
  end
  get '/dashboard', to: 'pages#dashboard'
end
