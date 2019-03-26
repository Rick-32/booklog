class UsersController < ApplicationController
layout 'users'
before_action :set_user, only: [:profile, :edit, :update, :destroy]

	def home
	end

	def profile
	end

	def edit
	end

	def update

		respond_to do |format|
			if @user.update(user_params)
				format.html{ redirect_to controller: 'users', action: 'profile', notice: 'Profile was successfully updated.' }
				format.json{ render :profile, status: :ok, location: @user }
			else
				format.html { render :edit }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

private

	def set_user
		@user = current_user
	end
	def user_params
		params.require(:user).permit(:booklog_id, :name, :gender, :bookshelf_name, :prefecture_id, :hometown, :occupation, :profile, :bookshelf_profile, :birth_y, :birth_m, :birth_d)
	end
end
