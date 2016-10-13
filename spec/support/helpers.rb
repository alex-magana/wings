module Helpers
  def login_as(user)
    authenticate(user.email, user.password)
    request.session[:user_id] = user.id
  end

  def authenticate(email, password)
    @user = User.find_by_email(email)
    @user.authenticate(password)
  end

  def sign_in_with(email, password)
    visit login_path
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Log In'
  end

  def sign_up_with(name, email, password, password_confirmation)
    visit root_path
    click_link 'Signup'
    fill_in 'user_name', with: name
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password_confirmation
    click_button 'Sign up'
  end

  def stub_current_user(user)
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)
  end
end
