class UsersController < ApplicationController

	def new
		
	end

	def create
		@user = User.new(user_params)

		if @user.save
			@person = Person.new(person_params)
			if @person.save
				flash[:notice] = "Successfully Created Account!"
				redirect_to :login_users_path
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
		
	end

	private
		def user_params
			params.require(:user).permit(:username, :password, :password_confirmation, :role)
		end

		def person_params
			params.require(:person).permit(:first_name, :last_name, :mid_name, :address, :contact_num, :email).merge(:user_id => @user.id)
		end

end
