class ReviewsController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    if params[:book_id]
      @reviews = Book.find(params[:book_id]).reviews
    else
      @reviews = Review.all
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new(user_id: current_user.id, book_id: @book.id)
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      flash[:danger] = @review.errors.full_messages
      redirect_to root_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :book_id, :user_id)
  end
end
