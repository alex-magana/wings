class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(to_uppercase(create_params))
    if @user.save
      log_in(@user)
      redirect_to flights_path
    else
      render :new
    end
  end

  def reset_password
  end

  def send_reset_email
    @user = User.check_email(to_uppercase(send_reset_email_params))
    if @user.nil?
      flash[:notice] = Messages.email_not_available
      redirect_to reset_password_path
    else
      process_password_reset(@user)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def create_params
    params.require(:user).permit(
      :first_name,
      :middle_name,
      :last_name,
      :email,
      :password
    )
  end

  def send_reset_email_params
    params.permit(:email)
  end

  def generate_reset_password
    SecureRandom.hex(7).upcase
  end

  def process_password_reset(user)
    user.password = generate_reset_password
    if user.save
      AppMailer.password_send(user).deliver_now
      set_send_reset_email_response(true)
    else
      set_send_reset_email_response(false)
    end
  end

  def set_send_reset_email_response(status)
    if status
      flash[:notice] = Messages.password_reset_successful
      redirect_to login_path
    else
      flash[:notice] = Messages.password_reset_unsuccessful
      redirect_to reset_password_path
    end
  end
end
