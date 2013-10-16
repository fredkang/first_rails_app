class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show

  end

  def new
  end

  def create
  	
  	# puts params

  	@users = User.all

  	# render :text=>params
  	@user = User.new(first_name: params['first_name'], last_name: params['last_name'], email_address: params['email'], password: params['password'])
  	# user.save
  	# redirect_to user_path(params[:user_id])
  	# redirect_to user_path(@user)

  	if @user.save
  		redirect_to '/users', notice: 'User was successfully created'
  	else
  		render action: "new"
  	end

  	
  	# @user = User.new(params[:user])

  	
  end
end
