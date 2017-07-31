Rails.application.routes.draw do
  devise_for :users
  
  resources :movies do
  	collection do
  		get 'search'
  	end
  end
  	resources :reviews, except: [:show, :index]

  	root "movies#index"
  end
