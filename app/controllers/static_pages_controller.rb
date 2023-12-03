class StaticPagesController < ApplicationController
  skip_before_action :require_login

  def top; end

  def privacy_policy; end

  def terms_of_use; end
end
