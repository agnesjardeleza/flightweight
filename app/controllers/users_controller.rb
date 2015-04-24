class UsersController < ApplicationController

	def new
		
	end

	def create
		render plain: params[:user].inspect
	end

	def edit
			
	end

	def update
			
	end

	def destroy
		
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
      @user = (current_user.role == 'admin')? User.where(user_id:current_user.id).first : nil
      redirect_to :root
    else
      flash[:error] = "Invalid username or password."
      redirect_to sign_in_users_path
    end


  end

end
