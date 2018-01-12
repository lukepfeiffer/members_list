class UsersController < ApplicationController
  def index
    @users = User.all.reverse
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to users_path
    else
      redirect_to edit_user_path(user.id)
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to users_path
    else
      redirect_to new_user_path
    end
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :age
    )
  end
end
