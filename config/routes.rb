Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "my_sessions", to: "pages#list", as: :my_sessions
  resources :sport_sessions, only: %w[index show new create] do
    collection do
      post :filter
    end
    resources :attendees, only: %w[create]
  end
  resources :chatrooms, only: %w[index show] do
    resources :messages, only: %w[create]
  end
  resources :venues, only: %w[create]
end
