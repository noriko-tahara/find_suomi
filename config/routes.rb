Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "letter_opener" if Rails.env.development?
  # Defines the root path route ("/")
  root "static_pages#top"

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  get 'sign_up', to: 'users#new'

  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'terms_of_use', to: 'static_pages#terms_of_use'

  resources :bookmarks, only: %i[create destroy]
  resources :facilities, only: %i[index show]  do
    resources :reviews, shallow: true
    collection do
      get :bookmarks
    end
  end
  resources :users, only: %i[new create]
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]

end
