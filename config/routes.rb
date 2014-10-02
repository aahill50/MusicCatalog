MusicCatalog::Application.routes.draw do
  root to: 'users#show'
  resource :user, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
end
