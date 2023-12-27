class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

 def new
    @book = Book.new
 end

 def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      flash[:notice] = "error"
      @books = Book.all
      @user = current_user
      render :index
    end
 end

  def index
    @books = Book.all
    @book = Book.new

    @user = User.find(current_user.id)
    @book_comment = BookComment.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @newbook = Book.new
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "投稿削除に成功しました。"
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    book = Book.find(params[:id])
    user = book.user
    unless user.id == current_user.id
      redirect_to books_path
    end
  end

end