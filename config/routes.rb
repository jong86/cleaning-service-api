Rails.application.routes.draw do

  root to: 'home#index'

  resources :clients, except: [:index, :show, :update, :destroy] do
    resources :job_requests, shallow: true
  end
  resource :client, only: [:update, :destroy]
  get 'profile', to: 'clients#show'


  namespace :admin do
    resources :employees, :jobs
    resources :clients, except: :create
    resources :job_requests, except: [:create, :update]
    resources :interviews
  end

  resources :employees, only: [:update] do
    resources :jobs, only: [:index, :show, :update], shallow: true
  end

  post 'authenticate', to: 'authentication#authenticate'
end
