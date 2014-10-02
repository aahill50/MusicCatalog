MusicCatalog::Application.routes.draw do
  root to: 'users#index'
  resources :users, only: [:index, :new, :create]
  resource :user, only: :show
  resource :session, only: [:new, :create, :destroy]
end
