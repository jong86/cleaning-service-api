Rails.application.routes.draw do

  namespace :guest do
    get 'jobs/billing'
  end

  root to: 'home#index'

  # resources :clients, only: :create
  namespace :client do
    match '/', to: 'client#destroy', via: [:delete]
    match '/', to: 'client#update', via: [:patch, :put]
    resources :job_requests, shallow: true
    resources :jobs, only: [:index, :show]
    resources :interviews, only: :index
  end
  match '/clients', to: 'client/client#create', via: [:post]
  get 'profile', to: 'client/client#show'

  namespace :guest do
    match '/job_requests', to: 'job_requests#create', via: [:post]
    match '/billing/:uuid', to: 'jobs#show_bill', via: [:get]
    match '/billing/:uuid', to: 'jobs#pay_bill', via: [:post]
  end

  namespace :employee do
    root :to => "employee#index"
    resources :jobs, only: [:index, :show, :update]
  end

  namespace :admin do
    resources :dashboard, only: :index
    resources :employees, :jobs
    resources :clients, except: :create
    resources :job_requests, except: :create
    resources :interviews
  end

  post 'authenticate', to: 'authentication#authenticate'


  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
