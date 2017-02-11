class ReviewsController < ApplicationController
  def index
    @reviews = Book.find(params[:id]).Review.all
  end

  def new
    @book = Book.find(params[:book_id])
    @review = @book.reviews.build
  end

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.new(review_params)

    if @review.save
      redirect_to book_path(params[:book_id])
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:reviewer, :post, :rating)
  end
end
