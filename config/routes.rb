Rails.application.routes.draw do
  devise_for :users, :controllers => {
		:registrations => 'users/registrations',
		:sessions => 'users/sessions'
	}

	devise_scope :user do
		get 'confirm_email', to: 'users/registrations#confirm_email'
	end

	root 'books#index'
	resources :users, only: [:index, :edit, :update, :destroy ] do
		collection do
			# get :profile
			get :home
			get '/logout' 				=> "users#logout", as: :logout
			get '/profile' 				=> "users#profile", as: :profile
		end
	end

	resources :books, only: [:index, :show] do
		resources :users, only: :show
			resources :books, only: [:index, :delete]
	end
end
