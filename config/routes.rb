Rails.application.routes.draw do

  root to: 'home#index'

  resources :clients, only: :create
  namespace :client do
    match '/', to: 'client#destroy', via: [:delete]
    match '/', to: 'client#update', via: [:patch, :put]
    resources :job_requests, shallow: true
    resources :jobs, only: [:index, :show]
    resources :interviews, only: :index
  end
  get 'profile', to: 'client/client#show'

  namespace :guest do
    match '/job_requests', to: 'job_requests#create', via: [:post]
  end

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
