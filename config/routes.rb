Rails.application.routes.draw do
  get 'user/new'

  devise_for :companies
	root "posts#index"
  get '/signup', to: 'user#new'
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
