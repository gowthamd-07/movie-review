Rails.application.routes.draw do
  resources :movies do
    resources :reviews
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }

  root 'movies#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
