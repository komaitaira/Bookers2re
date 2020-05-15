class UsersController < ApplicationController
  before_action :authenticate_user!
  # (ログインしていない状態で他のページに遷移しようとした場合、ログインページに遷移する)

  def index
    @users = User.all
  end

  def show
  	@book = Book.new
  	@user = User.find(params[:id])
  	@books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
