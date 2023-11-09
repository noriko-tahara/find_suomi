class FacilitiesController < ApplicationController
  skip_before_action :require_login

  def index
    @facilities = Facility.all
  end

  def show
    @facility = Facility.find(params[:id])
  end
end
