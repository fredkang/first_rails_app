class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  end

  def edit
  	@user = User.find(params[:id])
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
  		redirect_to '/users', notice: 'User ' +@user.id.to_s+ ' was successfully created'
  	else
  		render action: "new"
  	end
  	# @user = User.new(params[:user])
  end

  def update
  	@user = User.find(params[:id])

  	# if @user.email_address == params['user']['email_address']
  	# 	blah = @user.update_without_email_address(:first_name=>params['user']['first_name'], :last_name=>params['user']['last_name'], :password=>params['user']['password'])
  	# else
  	# 	blah = @user.update(user_params)
  	# end
  	@newUser = {}

  	if(params['user']['first_name']!="")
  		@newUser['first_name'] = params['user']['first_name']
  	end
	if(params['user']['last_name']!="")
		@newUser['last_name'] = params['user']['last_name']
	end
	if(params['user']['email_address']!="")
		@newUser['email_address'] = params['user']['email_address']
	end
	if(params['user']['password']!="")
		@newUser['password'] = params['user']['password']
  	end

  	if @user.update(@newUser)
  		# @user.update
  		redirect_to @user, notice: 'User was successfully created'
  	else
  		render action: "edit"
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email_address, :password)
  end

end
