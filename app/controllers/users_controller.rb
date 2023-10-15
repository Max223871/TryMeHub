class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      # Handle a successful update.
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    # Redirect to users list after delete.
    redirect_to users_path
  end

  def update_profile_picture
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile picture was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :gender, :country, :terms_and_conditions, :profile_picture)
  end
end
