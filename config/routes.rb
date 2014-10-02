MusicCatalog::Application.routes.draw do
  root to: 'bands#index'
  resource :user, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :bands
  resources :albums, only: [:new, :create, :edit, :show, :update, :destroy]
  resources :tracks, only: [:new, :create, :edit, :show, :update, :destroy] do
    resources :notes, only: [:create, :update, :destroy]
  end
end

