Rails.application.routes.draw do
  devise_for :users, :controllers => {
		:registrations => 'users/registrations',
		:sessions => 'users/sessions'
	}

	devise_scope :user do
		get 'confirm_email', to: 'users/registrations#confirm_email'
	end

	resources :users
	root 'books#index'
	get 'users/:id' => "users#show", as: :home
	get '/logout' => "users#logout", as: :logout


end
