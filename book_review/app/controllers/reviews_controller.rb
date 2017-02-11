class ReviewsController < ApplicationController
  def index
    @reviews = Book.find(params[:id]).Review.all
  end

  def new
    @review = Book.find(params[:id]).Review.build
  end

  def create
    @review = Book.find(params[:id]).Review.new(review_params)

    if @review.save
      redirect_to book_path(:book_id)
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
