Rails.application.routes.draw do
  get 'sessions/login'
  post 'sessions/login_attempt'
  get 'sessions/logout'

  root 'actions#index'

  resources :actions, only: [:index, :new, :create] do
  end
  resources :activities, only: [:new, :create]
  resources :users, only: [:new, :create]
end
