class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@activities_timeline = @user.activity.order('created_at desc')
	end
end
