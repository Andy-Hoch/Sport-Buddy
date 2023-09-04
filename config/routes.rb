Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "my_sessions", to: "pages#list", as: :my_sessions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :sport_sessions, only: %w[index show new create] do
    resources :attendees, only: %w[create]
  end
  resources :chatrooms, only: %w[show] do
    resources :messages, only: %w[create]
  end
end
