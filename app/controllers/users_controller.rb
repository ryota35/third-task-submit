class UsersController < ApplicationController

  def top
  end

  def index
    @users = User.all
    @user = current_user
    @new = Book.new
  end

  def show
     @user = User.find(params[:id])
     @new = Book.new
     @books = Book.where(user_id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user.id), notice:'You have updated user successfully.'
    else
      render "edit"
    end
  end


private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
