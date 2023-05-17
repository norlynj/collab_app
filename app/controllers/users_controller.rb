class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      # Handle successful user creation
      redirect_to @user, notice: 'User was successfully created.'
    else
      # Handle validation errors
      flash.now[:alert] = 'Failed to create user.'
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # Handle successful user update
      redirect_to @user, notice: 'User was successfully updated.'
    else
      # Handle validation errors
      flash.now[:alert] = 'Failed to update user.'
      render 'edit'
    end
  end

  # Other controller actions

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
