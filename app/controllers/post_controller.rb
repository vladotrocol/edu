class PostController < ApplicationController
  def index
    
    @users = User.all
    @posts = Post.all
  end

  def new
  	@post = Post.new({:title => 'New Title'})
  end

  def edit
  end

  def create
  	@post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.content = dat_markdown(@post.content)
		if @post.save
      flash[:notice] = "Post created successfully."
			redirect_to(:action => 'index')
		else
			render('new')
		end
  end

  def create_email
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.content = dat_markdown(@post.content)
    end

  def post_params
		params.require(:post).permit(:title, :description, :content)
	end
end
