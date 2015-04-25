class PostsController < ApplicationController
  
  def new
    @post = Post.new 
  end
  
  def index
    @posts = Post.all
  end

  def edit
    @post= Post.find(params[:id])
    dof = @post.date_of_flight.to_s.split('-')
    @dof_str = dof[1] + "/" + dof[2] + "/" + dof[0]
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
    @user = User.find(@post.poster_id)
  end

  def create
    @post = Post.new(post_params)
   # @post.poster_id = current_user.id
    @post.date_of_flight = DateTime.strptime(params[:date], '%m/%d/%Y %I:%M %P')
    @post.is_active = true
    if @post.save 
      redirect_to @post
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id]).destroy
    redirect_to @user
  end

  def search_results
    @flight_number = params[:flight_number]
    @posts = Post.where(flight_number: @flight_number)
  end

  def search_destination_date
    @destination = params[:destination]
    @origin = params[:origin]
    @date = params[:date]
  end
  
  
  private
    def post_params
      params.require(:post).permit(:poster_id, :weight, :date_of_flight, :details, :category, :flight_number, :is_active, :origin, :destination )

    end

    def post_update_params
      params.require(:post).permit(:poster_id, :weight, :date_of_flight, :details, :category, :flight_number, :is_active, :origin, :destination )
    end
    
end
