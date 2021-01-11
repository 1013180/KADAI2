class BooksController < ApplicationController
  def index
    @book = Book.new
  end

  def show
   @book = Book.find(params[:id])
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def top
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
    else
    render :index
  end
  end

  def edit
     @book = Book.find(params[:id])
  end

    def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book)
    else
    render("books/new")
    end
    end

   def destroy
    @book = Book.find(params[:id])
    book.destroy
   end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end