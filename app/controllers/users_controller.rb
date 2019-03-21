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

	def update
		@user = current_user
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
	def user_params
		params.require(:user).permit(:user_id, :name, :gender, :bookshelf_name, :prefecture, :hometown, :occupation, :profile, :bookshelf_profile, :birth_y, :birth_m, :birth_d)
	end

	def set_user
		@user = User.find(params[:id])
	end
end
