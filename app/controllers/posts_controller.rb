class PostsController < ApplicationController
  
  def new
    @post = Post.new 
  end
  
  def index
    @posts = Post.all
  end

  def edit
    @post= Post.find_by(poster_id: params[:poster_id])
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
    @post = Post.find_by(poster_id: params[:poster_id])
    @user = User.find(@post.poster_id)
    dof = @post.date_of_flight.to_s.split('-')
    @dof_str = dof[1] + "/" + dof[2] + "/" + dof[0]
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

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:poster_id]).destroy
    redirect_to @user
  end

  def search_results
    @flight_number = params[:flight_number]
    @posts = Post.where(@flight_number)
  end

  
  private
    def post_params
      params.require(:post).permit(:poster_id, :weight, :date_of_flight, :category, :details, :ticket_id)
    end

    def post_update_params
      params.require(:post).permit(:poster_id, :weight, :date_of_flight, :details, :category, :ticket_id, :is_active)
    end
    
end