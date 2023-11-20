class FacilitiesController < ApplicationController
  skip_before_action :require_login

  def index
    @search_facilities_form = SearchFacilitiesForm.new(search_params)
    @facilities = @search_facilities_form.search.order(name: :asc)
  end

  def bookmarks
    @bookmark_facilities = current_user.bookmark_facilities.includes(:users).order(name: :asc)
  end

  def show
    @facility = Facility.find(params[:id])
  end

  def search_params
    params[:q]&.permit(:name, :description, :address, :genre_id, :prefecture_id)
  end
end
