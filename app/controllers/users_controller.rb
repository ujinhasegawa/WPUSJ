class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user                = User.find(params[:id])
		@activities_timeline = @user.activity.order('created_at desc')
		@summary             = @user.activity.group(:title).count
		@summary_each_year   = @user.summarize_activities_each_year
	end
end
