# coding: utf-8

class UsersController < ApplicationController

	def new
	  @user = User.new
	end

	def show
	end

	def index
	  @users = User.all
	end

	def create
	  @user = User.new(user_params)
	  @user.save
	  redirect_to controller: 'users', action: 'index'
	end

	private

	def user_params
	  params.require(:user).permit(:name, :email, :password)
	end
end
