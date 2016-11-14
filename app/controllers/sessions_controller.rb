class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(to_uppercase(create_params))
    if @user.nil?
      flash[:notice] = Messages.invalid_login_credentials
      render :new
    else
      log_in(@user)
      redirect_to flights_path
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

  def create_params
    params.permit(:email, :password)
  end
end
