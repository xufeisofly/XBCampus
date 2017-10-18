Rails.application.routes.draw do
  # get 'user/new'

  devise_for :companies
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
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
