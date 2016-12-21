class UsersController < ApplicationController
	def index

	end
	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to '/bright_ideas'
		else
			flash[:register_errors] =user.errors.full_messages
			redirect_to '/'
		end
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		user = User.update(params[:id], update_params )

		redirect_to '/users'
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :alias)
		end
		def update_params
			params.require(:user).permit(:first_name, :last_name, :email, :alias)
		end
end

