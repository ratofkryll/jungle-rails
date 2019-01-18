class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]

    if @review.save!
      redirect_to product_path(@review.product_id)
    else
      redirect_to product_path(@review.product_id)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :back
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description, :user_id)
  end

end
