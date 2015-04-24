class PostsController < ApplicationController
  
  def new
    @post = Post.new 
  end
  
  def index
    @posts = Post.all
  end

  def edit
    @post= Post.find(params[:id])
  end

  def update
    @post =  Post.find(params[:id])

    if @post.update(post_update_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    if @post.save 
      redirec_to @post
    else
      render 'new'
    end
  end
  
  private
    def post_params
      params.require(:post).permit(:poster_id, :weight, :date_of_flight, :details)
    end

    def post_update_params
      params.require(:post).permit(:weight, :date_of_flight, :details)
    end


end
