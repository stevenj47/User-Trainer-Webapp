class UsersController < ApplicationController
	before_action :logged_in_user, only: [:show]

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.client = params[:client]
		if @user.save
			log_in @user
			redirect_to @user
		else
			render 'new'
		end
	end

	private

		def user_params
			params.require(:user).permit(:name, :email, :password,
										 :password_confirmation, :client)
		end

		# Checks if user is logged in
    	def logged_in_user
      		unless logged_in?
        		redirect_to login_path
      		end
    	end

end
