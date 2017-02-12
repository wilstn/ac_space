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
      avg = @book.avg_rating
      counter = @book.review.count - 1
      hello = (@review[:rating] + counter * avg)/(counter + 1)
      @book.update(avg_rating: hello)

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
      total_rates = 0.0
      @book.review.each do |review_obj|
        total_rates += review_obj.rating
      end
      hello = (total_rates / @book.review.count).round(1)
      @book.update(avg_rating: hello)

      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @review = @book.review.find(params[:id])
    @review.destroy

    total_rates = 0.0

    @book.review.each do |review_obj|
      total_rates += review_obj.rating
    end
    hello = (total_rates / @book.review.count).round(1)
    @book.update(avg_rating: hello)

    redirect_to book_path(@book)
  end

  private

  def review_params
    params.require(:review).permit(:reviewer, :post, :rating)
  end
end
