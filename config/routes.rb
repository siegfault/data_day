Rails.application.routes.draw do
  root 'actions#index'

  resources :sessions, only: [:create, :new] do
    collection do
      get :logout
      delete :destroy
    end
  end

  get 'auth/google_oauth2/callback', controller: :sessions, action: :create

  resources :actions, only: [:index, :create, :edit, :update, :destroy] do
    post :end
  end

  resources :activities, only: [:new, :create]

  resources :users, only: [:new, :create]

  resources :reports, only: :index
end
