Rails.application.routes.draw do
  root "home#index"
  devise_for :users

  resources :sections
  resources :courses do
    resources :recommendations, only: [:new, :create]
  end
  namespace :admin do
    # Admin dashboard route
    get 'dashboard', to: 'dashboard#index', as: 'dashboard'

    # Routes for user approvals
    resources :users, only: [:index] do
      member do
        post 'approve'
        delete 'decline'
      end
    end

    post 'courses/reload', to: 'courses#reload', as: 'reload_courses'
  end

  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
   get '*path', to: 'errors#404'
end
