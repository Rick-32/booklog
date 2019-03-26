Rails.application.routes.draw do
  devise_for :users, :controllers => {
		:registrations => 'users/registrations',
		:sessions => 'users/sessions'
	}

	devise_scope :user do
		get 'confirm_email', to: 'users/registrations#confirm_email'
	end

	root 'books#index'
	resources :users, only: [:edit, :update, :destroy ] do
		collection do
			get :profile
			get :home
		end
	end
	get '/logout' 				=> "users#logout", as: :logout
	get '/profile' 				=> "users#show", as: :profile
end
