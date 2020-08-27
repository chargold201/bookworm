class BooksController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find_by(id: params[:id])
  end
end
