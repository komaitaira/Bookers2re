class BooksController < ApplicationController
  before_action :authenticate_user!


  def index
  end

  def show
    # @user = current_user
    @book = Book.find(params[:id])
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end