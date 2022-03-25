class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "successfully 新規追加に成功しました"
      redirect_to "/books/#{@book.id}"
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
  end

  def show
     @book = Book.find(params[:id])
  end

  def edit
     @book = Book.find(params[:id])
    if @book.user == current_user.id
      render "edit"
    else
      @books = Book.all
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully 更新に成功しました"
      redirect_to "/books/#{@book.id}"
    else

      render :edit
    end
  end

   def destroy
    @book = Book.find(params[:id])
    if @book.destroy
       flash[:notice] = "successfully 削除に成功しました"
    else
      flash.now[:notice] = "更新に失敗しました"
    end
    redirect_to "/books"
   end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
