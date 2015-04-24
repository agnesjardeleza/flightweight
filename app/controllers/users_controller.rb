class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])

		if @user
			@person = Person.find_by(user_id: @user.id)
			@posts = Post.where(poster_id: @user.id)
			@comments = Comment.where(user_id: @user.id)
		else
			redirect_to :root
		end
	end

	def new
		
	end

	def create
		@user = User.new(user_params)

		if @user.save
			@person = Person.new(person_params)
			if @person.save
				flash[:notice] = "Successfully Created Account!"
				redirect_to login_users_path
			else
				flash.now[:error] = @person.errors.full_messages.first
				render 'users/new'
			end
		else
			flash.now[:error] = @user.errors.full_messages.first
			render 'users/new'
		end
	end

	def edit
			
	end

	def update
			
	end
 
  def destroy
    
    @User = User.find(current_user.id)

    @posts = Post.where(user_id: current_user.id)

    @posts.each do |x|
      x.destroy
    end

  end
  def login
    
    if current_user == nil
      @user = User.new
    end

  end

  def sign_in
    
    username = params[:user][:username]
    password = params[:user][:password]

    user = User.authenticate(username, password)

    if user
      session[:user_id] = user.id
      @user = (current_user.role == 'admin')? User.find(current_user.id) : nil
      redirect_to :root
    else
      flash[:error] = "Invalid username or password."
      redirect_to login_users_path
    end
  end

	def logout
		session[:user_id] = nil
		redirect_to :root		
	end

	private
		def user_params
			params.require(:user).permit(:username, :password, :password_confirmation, :role)
		end

		def person_params
			params.require(:person).permit(:first_name, :last_name, :mid_name, :address, :contact_num, :email).merge(:user_id => @user.id)
		end
end
