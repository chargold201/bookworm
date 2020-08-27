class BooksController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    @books = Book.all
  end
end
