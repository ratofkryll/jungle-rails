class ReviewsController < ApplicationController

  def create
    @review = Reviews.new(review_params)
    @review.product_id = params[:product_id]
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end

end
