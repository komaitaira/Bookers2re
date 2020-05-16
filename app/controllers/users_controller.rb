class UsersController < ApplicationController
  # (ログインしていない状態で他のページに遷移しようとした場合、ログインページに遷移する)
  before_action :authenticate_user!
  # 編集画面表示、修正内容の更新アクション実行時はログインしているユーザーの場合のみ実行可とする。 
  before_action :correct_user, only: [:edit, :update]

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
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user.id)
    end
  end

end
