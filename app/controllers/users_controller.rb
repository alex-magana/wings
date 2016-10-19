class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end
  def show
  end
  def new
    @user = User.new
  end
  def edit
  end
  def create
    @user = User.new(user_params)
    @user.role_id = 2
    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to new_user_path }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
  end
  def destroy
  end
  def login
  end
  def user_authenticate
    @user = User.user_authenticate(user_params).first
    if @user.nil? == false
      session[:user_id] = @user.id
      redirect_to flights_path
    else
      flash[:notice] = "Invalid username or password."
      redirect_to login_path
    end
  end
  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
  def reset_password
  end
  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.permit(:first_name, :middle_name, :last_name, :email, :password, :role_id)
    end
end
