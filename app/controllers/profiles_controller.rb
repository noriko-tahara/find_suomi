class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]
  before_action :ensure_nomal_user, only: %i[edit update]
  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: t('defaults.message.updated', item: User.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_updated', item: User.model_name.human)
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :avatar_cache)
  end

  def ensure_nomal_user
    if current_user.name == 'ゲストユーザー'
      redirect_to profile_path, warning: 'ゲストユーザーの編集・削除はできません'
    end
  end
end
