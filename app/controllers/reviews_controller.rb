class ReviewsController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
  end
end
