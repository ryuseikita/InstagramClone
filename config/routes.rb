Rails.application.routes.draw do
  root to: 'instagrams#index'
  resources :users, only: [:new, :create, :destroy,:show] do
    collection do
      get :favorite
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :instagrams, only: [:index]
  # resources :favorites, only: [:create, :destroy]
  resources:pictures do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy]
  resources :profiles, only: [:edit,:update] do
    collection do
      get :create
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
