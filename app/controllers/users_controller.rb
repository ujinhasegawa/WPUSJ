# coding: utf-8
require 'openssl'

class UsersController < ApplicationController

	def new
	  @user = User.new
	end

	def login
	end

	def confirm_auth
		user = User.find_by_email(get_hash(params[:email]))

		alert_message = 'メールアドレスかパスワードが間違っています。'
		redirect_to :user_login, alert: alert_message and return if user.nil?
		redirect_to :user_login, alert: alert_message and return if user.password != get_hash(params[:password])

		user.update_attributes(authenticity_token: params[:authenticity_token])

		redirect_to action: 'index'
	end

	def show
	end

	def index
	  @users = User.all
	end

	def create
		params[:user][:password] = get_hash(params[:user][:password])
		params[:user][:email] = get_hash(params[:user][:email])
		params[:user][:authenticity_token] = params[:authenticity_token]
	  @user = User.new(user_params)
	  @user.save
	  redirect_to action: 'index'
	end

	private

	def user_params
	  params.require(:user).permit(:name, :email, :password, :authenticity_token)
	end

	def get_hash(char)
		digest = OpenSSL::Digest.new('sha384')
		digest.update(char)
		digest.hexdigest()
	end
end
