Rails.application.routes.draw do
  # get 'user/new'
	root "posts#index"
  get '/student/signup', to: 'users#new'
  get '/studentsignin', to: 'sessions#new'
  match '/studentsignout', to: 'sessions#destroy', via: :delete
  resources :posts do
    resources :comments
  end
  resources :users do
    member do
      get :confirm_email
    end
  end
  resources :companies
  resources :sessions, only: [:new, :create, :destroy]
end
