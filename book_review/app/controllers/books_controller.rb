class BooksController < ApplicationController

  def index
    @books = Book.all
    if params[:search]
      @books = Book.search(params[:search])
    else
      @books = Book.all
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  # def search
  #   search_value = params[:search]
  #   @books = Book.where("summary like ?", "%#{search_value}%")
  #   render 'index'
  # end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to books_path
    else
      redirect_to edit_book_path(@book)
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :summary, :genre)
  end

end
