class ReviewsController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    if params[:book_id]
      @reviews = Book.find(params[:book_id]).reviews
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @reviews = User.find(params[:user_id]).reviews
    else
      @reviews = Review.all
    end
    @reviews = @reviews.order(:review_timestamp).reverse
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
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(title: params[:review][:title], content: params[:review][:content])
    if @review.save
      redirect_to review_path(@review)
    else
      flash[:danger] = @review.errors.full_messages
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :book_id, :user_id)
  end
end
