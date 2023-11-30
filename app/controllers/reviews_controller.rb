class ReviewsController < ApplicationController
  def new
    @facility = Facility.find(params[:facility_id])
    @review = Review.new
  end

  def create
    review = current_user.reviews.build(review_params)
    if review.save
      redirect_to facility_path(review.facility), success: t('defaults.message.posted', item: Review.model_name.human)
    else
      redirect_to facility_path(review.facility), error: t('defaults.message.not_posted', item: Review.model_name.human)
    end
  end

  def edit
    @review = current_user.reviews.find(params[:id])
  end

  def update
    @review = current_user.reviews.find(params[:id])
    if @review.update(update_review_params)
      redirect_to facility_path(@review.facility), success: t('defaults.message.updated', item: Review.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_updated', item: Review.model_name.human)
      render :edit
    end
  end

  def destroy
    review = current_user.reviews.find(params[:id])
    review.destroy!
    redirect_to facility_path(review.facility), success: t('defaults.message.deleted', item: Review.model_name.human)
  end

  private

  def review_params
    params.require(:review).permit(:body, :review_image, :review_image_cache).merge(facility_id: params[:facility_id])
  end

  def update_review_params
    params.require(:review).permit(:body, :review_image, :review_image_cache)
  end
end
