class SearchesController < ApplicationController

	def search_username
		@user = User.find_by_username(params[:username])

		if @user
			redirect_to user_path(id: @user)
		else
			redirect_to :root
		end
	end

	def search_flight_number
		redirect_to search_results_posts_path(flight_number: params[:flight_number])
	end

end
