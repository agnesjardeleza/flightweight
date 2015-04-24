class CommentsController < ApplicationController

	def new
		@comment = Comment.new
		@user = User.find(params[:user_id])
	end

	def create
		@user = User.find(params[:comment][:user_id])
		@comment = Comment.new(comment_params)

		if @comment.save
			redirect_to @user
		else
			render 'comments/new'
		end
	end

	def edit
		@comment = Comment.find(params[:id])
		@user = User.find(@comment.user_id)
	end

	def update

		@comment = Comment.find(params[:id])

		if @comment.update(comment_params)
			@user = User.find(@comment.user_id)
			redirect_to @user
		else
			redirect_to :root
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@comment = Comment.find(params[:id]).destroy
		redirect_to @user
	end

	private
		def comment_params
			params.require(:comment).permit(:user_id, :commenter_id, :comment)
		end
end
