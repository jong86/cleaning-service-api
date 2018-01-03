Rails.application.routes.draw do

  root to: 'home#index'

  resources :clients, except: :index do
    resources :job_requests, shallow: true
  end

  namespace :admin do
    resources :employees, :jobs
    resources :clients, except: :create
    resources :job_requests, except: [:create, :update]
    resources :interviews
  end

  resources :employees, only: [:show, :update] do
    resources :jobs, only: [:index, :show, :update], shallow: true
  end

  post 'authenticate', to: 'authentication#authenticate'
end
