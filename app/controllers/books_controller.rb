class BooksController < ApplicationController
  before_action :authorize, except [:index, :show]
end
