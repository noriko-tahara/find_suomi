module LoginModule
  def login(user)
    visit login_path
    fill_in User.human_attribute_name(:email), with: user.email
    fill_in User.human_attribute_name(:password), with: 'password'
    click_button I18n.t('defaults.login')
  end
end
