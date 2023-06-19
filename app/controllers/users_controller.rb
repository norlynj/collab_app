class UsersController < ApplicationController

  def index
    @users = User.all
    @labels = Label.all
  end

  def show
    @user = User.find(params[:id])
  end

  # creates user using the permitted params
  def create
    if create_user_with_credentials(user_params)
      # Handle successful user creation
      redirect_to users_path, notice: 'User was successfully created.'
    else
      # Handle validation errors
      p @user.errors.full_messages
      redirect_to users_path
      flash.now[:alert] = 'Failed to create user.'
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

  # Creates a new user with the given name and email, and generates a random password
  # Generates a random password
  def create_user_with_credentials(user_params)
    password = SecureRandom.alphanumeric(8)
    User.create(name: user_params[:name], email: user_params[:email], password: password, role: user_params[:role], label_id: user_params[:label_id])
  end

 # Permits the name, email, and password parameters for user creation and update
  private

  def user_params
    params.permit(:name, :email, :authenticity_token, :role, :label_id)
  end
end
