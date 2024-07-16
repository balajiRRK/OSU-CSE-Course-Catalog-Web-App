Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  resources :courses
  resources :sections
  resources :instructors
  resources :graders
  resources :api_searches do
    collection do 
      get :fetch_courses
    end
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

    # get 'courses/reload', to: 'courses#reload', as: 'reload_courses'
    #new for loading the courses
    # post 'courses/load', to: 'courses#load', as: 'load_courses'
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
