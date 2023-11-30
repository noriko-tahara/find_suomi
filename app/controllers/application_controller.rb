class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :error, :info, :warning

  def not_authenticated
    flash[:warning] = t('defaults.message.require_login')
    redirect_to login_path
  end
end
