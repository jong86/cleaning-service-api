Rails.application.routes.draw do
  resources :jobs
  resources :job_requests
  resources :clients
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
