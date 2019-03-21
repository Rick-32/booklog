class UsersController < ApplicationController
layout 'users'

	def home
	end

	def profile
		@user = current_user
	end

	def edit
		@user = User.find(params[:id])
	end
end
