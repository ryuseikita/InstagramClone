Rails.application.routes.draw do
  resources :users, only: [:new, :create, :destroy,:show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :instagrams, only: [:index]
  # resources :favorites, only: [:create, :destroy]
  resources:pictures do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
