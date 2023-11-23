class ReviewsController < ApplicationController

  def create
    review = current_user.reviews.build(review_params)
    if review.save
      redirect_to facility_path(review.facility), success: t('defaults.message.posted', item: Review.model_name.human)
    else
      redirect_to facility_path(review.facility), danger: t('defaults.message.not_posted', item: Review.model_name.human)
    end
  end

  def destroy
    review = current_user.reviews.find(params[:id])
    review.destroy!
    redirect_to facility_path(review.facility), success: t('defaults.message.deleted', item: Review.model_name.human)
  end

  private

  def review_params
    params.require(:review).permit(:body).merge(facility_id: params[:facility_id])
  end
end