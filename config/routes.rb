Rails.application.routes.draw do
  devise_for :users, :controllers => {
		:registrations => 'users/registrations',
		:sessions => 'users/sessions'
	}

	devise_scope :user do
		get 'confirm_email', to: 'users/registrations#confirm_email'
	end

	root 'books#index'
	get '/logout' 				=> "users#logout", as: :logout
	get '/profile' 				=> "users#show", as: :profile
	get '/users/:id/edit' => "users#edit"
	patch 'users/:id' 		=> "users#update"

	resources :users do
		collection do
			get :profile
			get :home
		end
	end

end
