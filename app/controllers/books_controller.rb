class BooksController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @genre_options = Genre.all.map { |g| [ g.name, g.id ] }
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      # flash message with errors
      flash[:danger] = @book.errors.full_messages
      redirect_to new_book_path
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(title: params[:book][:title], author: params[:book][:author], genre_id: params[:book][:genre_id], isbn: params[:book][:isbn])
    redirect_to book_path(@book)
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre_id, :isbn)
  end
end
