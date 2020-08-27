class ReviewsController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find_by(id: params[:id])
  end
end
