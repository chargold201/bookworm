class ReviewsController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    @reviews = Review.all
  end
end
