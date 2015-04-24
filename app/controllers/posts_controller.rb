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
    @person = Person.find(@post.poster_id)
    @person_name = @person.first_name + " " + @person.mid_name + " " + @person.last_name 
  end

  def create
    @post = Post.new(post_params)
    @post.poster_id = current_user.id
    @post.date_of_flight = DateTime.strptime(params[:date], '%m/%d/%Y')
    if @post.save 
      redirect_to @post
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
