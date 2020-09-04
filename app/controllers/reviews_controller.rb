class ReviewsController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    if params[:book_id]
      @book = Book.find(params[:book_id])
      @title = "Reviews of #{ @book.title }"
      @reviews = @book.reviews
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @title = "#{ @user.name }'s Reviews"
      @reviews = User.find(params[:user_id]).reviews
    else
      @title = "All Reviews"
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

  def destroy
    Review.find(params[:id]).destroy
    redirect_to reviews_path
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
