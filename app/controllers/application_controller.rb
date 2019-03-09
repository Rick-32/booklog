class ApplicationController < ActionController::Base
	#before_filterを設定
	before_action :configure_permitted_parameters, if: :devise_controller?
	# before_action :authenticate_user!, except: :index

	def after_sign_in_path_for(resource)
		home_path(resource)
	end

	def after_sign_out_path_for(resource)
		logout_path
	end

	protected

	def configure_permitted_parameters
		#strong parametersを設定し、usernameを許可
		devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :user_id, :password, :password_confirmation])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:user_id, :password, :remember_me])
	end
end
