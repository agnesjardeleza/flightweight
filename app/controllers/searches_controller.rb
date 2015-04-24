class SearchesController < ApplicationController

	def search_username
		@user = User.find_by_username(params[:username])

		if @user
			redirect_to user_path(id: @user)
		else
			redirect_to :root
		end
	end

end
