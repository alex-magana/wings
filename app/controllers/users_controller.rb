class UsersController < ApplicationController
  def index
    @users = User.all
    # @bookings = Booking.where("user_id = ? and is_deleted = ?", @current_user, 0)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end

  def login
    render 'login'
  end

  private

    def user_params
      params.permit(:first_name, :middle_name, :last_name, :email, :password, :role_id)
    end
end
