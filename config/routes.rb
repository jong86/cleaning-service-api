Rails.application.routes.draw do

  root to: 'home#index'

  resources :clients, only: :create
  resource :client, only: [:update, :destroy] do
    resources :job_requests, shallow: true
    resources :jobs, only: [:index, :show]
    resources :interviews, only: :index
  end
  get 'profile', to: 'clients#show'

  namespace :employee do
    root :to => "employee#index"
    resources :jobs, only: [:index, :show, :update]
  end

  namespace :admin do
    resources :employees, :jobs
    resources :clients, except: :create
    resources :job_requests, except: :create
    resources :interviews
  end

  post 'authenticate', to: 'authentication#authenticate'
end
