class PostsController < ApplicationController
	def index
		@posts = Post.all.order('created_at DESC')
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		
		if @post.save
			redirect_to @post
		else
			render 'new'	
			# renders new method which is Post.new 
			# We want to render instead of redirect because that way you don;t lose what you typed in the body
		end
	end

	def show
			@post = Post.find(params[:id])
	end

	private
	def post_params
		params.require(:post).permit(:title, :body)
	end
end
