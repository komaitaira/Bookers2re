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
  end

  def update
  end

end
