class BooksController < ApplicationController
  # (ログインしていない状態で他のページに遷移しようとした場合、ログインページに遷移する)
  before_action :authenticate_user!
  # 編集画面表示、修正内容の更新アクション実行時はログインしているユーザーの場合のみ実行可とする。 
  before_action :correct_user, only: [:edit, :update]


  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
    @books = Book.new
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       flash[:notice] = "You have creatad book successfully."
       redirect_to book_path(@book.id)
    else
       @books = Book.all
       render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "You have updated book successfully."
       redirect_to book_path(@book.id)
    else
       render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    book = Book.find(params[:id])
    # belongs_toのおかげでbookオブジェクトからuserオブジェクトへアクセスできる。

    if book.user.id != current_user.id

      redirect_to books_path
    end
  end

end