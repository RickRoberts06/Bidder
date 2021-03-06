class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
    session[:user_id] = @user.id
    redirect_to root_path, notice: "Logged in!"
    else
      flash[:alert] = "Couldn't log in."
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update user_params
      redirect_to root_path, notice: "Information updated!"
    else
      render :edit
    end
  end

  def destroy

  end

  def my_reservation
    @user = current_user
    @reservations = @user.reservations
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
    :phone, :password, :password_confirmation, :intro, :avatar)
  end
end
