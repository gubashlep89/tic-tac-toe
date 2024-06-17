Rails.application.routes.draw do
  root 'games#new'
  resources :games, except: %i[index edit destroy] do
    scope module: :games do
      resources :restarts, only: :create
    end
  end
end
