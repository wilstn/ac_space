class ReviewsController < ApplicationController
  def index
    @reviews = Book.find(params[:book_id]).Review.all
  end

  def new
    @book = Book.find(params[:book_id])
    @review = @book.review.build
  end

  def create
    @book = Book.find(params[:book_id])
    @review = @book.review.new(review_params)

    if @review.save
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:id])
  end

  def update
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    book = Book.find(params[:book_id])
    @review = book.review.find(params[:id])
    @review.destroy
    redirect_to book_path(book)
  end

  private

  def review_params
    params.require(:review).permit(:reviewer, :post, :rating)
  end
end
