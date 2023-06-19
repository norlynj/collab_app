class UsersController < ApplicationController
  before_action :authenticate_user!, except: :create
  def index
    @users = User.all
    @labels = Label.all
  end

  # creates user using the permitted params
  def create
    @user = User.new(user_params)
    if @user.save
      # Handle successful user creation
      redirect_to users_path, notice: 'User was successfully created.'
    else
      # Handle validation errors
      flash.now[:alert] = 'Failed to create user.'
      redirect_to users_path
    end
  end

  # update user using the id
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # Handle successful user update
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      # Handle validation errors
      flash.now[:alert] = 'Failed to update user.'
      redirect_to users_path
    end
  end

 # Permits the name, email, and password parameters for user creation and update
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :authenticity_token)
  end
end
