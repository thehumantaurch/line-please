class UsersController < ApplicationController

  def show
    @user = Users.find(session[:id])
  end

  def new
    @user = Users.new
  end

  def create
    @user = Users.new(user_params)
    if @user.save
      session[:users_id] = @user.id
      redirect_to users_path(@user.id)
    end
  end

  def delete
    @user.destroy
  end

  private

  def user_params
    params.require(:users).permit(:username, :first_name, :last_name, :password, :password_confirmation, :email)
  end

end
