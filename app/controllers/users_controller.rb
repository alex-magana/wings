class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user_with_email = User.check_email(to_uppercase(user_params)).first
    if @user_with_email.nil? == false
      flash[:notice] = "The email provided is already in use."
      redirect_to new_user_path
    else
      @user = User.new(to_uppercase(user_params))
      @user.role_id = 2
      if @user.save
        set_session_user(@user)
        redirect_to flights_path, notice: "User was successfully created."
      else
        redirect_to new_user_path
      end
    end
  end

  def login
  end

  def user_authenticate
    @user = User.user_authenticate(to_uppercase(login_params)).first
    if @user.nil? == false
      set_session_user(@user)
      redirect_to flights_path
    else
      flash[:notice] = "Invalid username or password."
      redirect_to login_path
    end
  end

  def logout
    terminate_session
    redirect_to root_path
  end

  def reset_password
  end

  def send_reset_email
    @user = User.check_email(to_uppercase(reset_params)).first
    if @user.nil? == false
      @user.password = SecureRandom.hex(7).upcase
      if @user.save
        AppMailer.password_send(@user).deliver_now
        flash[:notice] = "Password reset successfully. Please check your email."
        redirect_to login_path
      else
        flash[:notice] = "Unable to reset password. Try again later."
        redirect_to reset_password_path
      end
    else
      flash[:notice] = "Email does not exist."
      redirect_to reset_password_path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_session_user(user)
    session[:user_id] = user.id
  end

  def terminate_session
    session[:user_id] = nil
  end

  def to_uppercase(params)
    params.each_pair { |_key, value| value.upcase! }
  end

  def user_params
    params.require(:user).permit(:first_name, :middle_name, :last_name,
                                 :email, :password)
  end

  def login_params
    params.permit(:email, :password)
  end

  def reset_params
    params.permit(:email)
  end
end
