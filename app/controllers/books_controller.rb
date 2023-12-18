class BooksController < ApplicationController
 def new
    @book = Book.new
 end

 def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to books_path
    else
      flash[:notice] = "error"
      @books = Book.all
      render :index
    end
 end

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "投稿削除に成功しました。"
    redirect_to books_path
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end