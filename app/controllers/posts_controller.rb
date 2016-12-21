class PostsController < ApplicationController
	def index
		@user = User.find(session[:user_id])
		@posts = Post.all		
	end
	def create
		@user = User.find(session[:user_id])
		post = Post.new(content: post_params[:content], user:@user)
		if post.save
			redirect_to '/bright_ideas'
		else
			flash[:post_errors] =post.errors.full_messages
			redirect_to '/bright_ideas'
		end
	end
	def destroy
		post = Post.destroy(params[:id])
	end
	def show
		@user = User.find(session[:user_id])
		@post = Post.find(params[:id])
	end
	def show_user
		@user = User.find(params[:id])
		@post = Post.where("user_id = ?", @user.id).to_a
	end
	def create_like

		@user = User.find(session[:user_id])
		post = Post.find(params[:id]).update(like:@user)
		p = Post.find(params[:id])
		liked_post = LikedPost.create(user: p.user, post: Post.find(params[:id]), liker: User.find(session[:user_id]))
		redirect_to '/bright_ideas'
	end
	private
		def post_params
			params.require(:post).permit(:content)
		end
end
