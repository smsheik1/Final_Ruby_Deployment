class SessionsController < ApplicationController
	def destroy
		reset_session
		redirect_to '/'
	end
	def create
		#valid credentials
		user = User.find_by(email:login_params[:email])
		if user && user.authenticate(login_params[:password])
			session[:user_id] = user.id
			redirect_to "/bright_ideas"
		else
			#invalid credentials
			flash[:login_errors] = ['Invalid credentials']
			redirect_to '/'
		end
	end

	private
		def login_params
			params.require(:login).permit(:email, :password)
		end
end


