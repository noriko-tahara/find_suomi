class FacilitiesController < ApplicationController
  skip_before_action :require_login

  def index
    @facilities = Facility.all
  end

  def bookmarks
    @bookmark_facilities = current_user.bookmark_facilities.includes(:users).order(name: :asc)
  end

  def show
    @facility = Facility.find(params[:id])
  end
end
