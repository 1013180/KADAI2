class BooksController < ApplicationController
  def index
    @book = Book.new
  end

  def show
  end

  def index
    @book = Book.new
    @books = Book.all
    logger.debug(@books.to_yaml)
  end

  def top
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path
  end

  def edit
     @book = Book.find(params[:id])
  end

    def update
     book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(blog)
    end

   def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
   end


    private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end