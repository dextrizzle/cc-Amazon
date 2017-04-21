class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    like = Like.new
    review = Review.find params[:review_id]
    like.review = review
    like.user = current_user
    if like.save
      redirect_to product_path(review.product), notice: 'thanks for liking!'
    else
      redirect_to product_path(review.product), alert: 'can\'t like! liked already!'
    end
  end

  def destroy
    review = Review.find params[:review_id]
    like = current_user.likes.find params[:id]
    like.destroy
    redirect_to review_path(review), notice: "like removed!"
  end
end
