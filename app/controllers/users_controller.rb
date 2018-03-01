class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update, :destroy]
  # before_action :logged_in?, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :password, :nausea, :happiness, :tickets, :height, :admin))
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    if logged_in?
      render :show
    else
      redirect_to home_path
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def get_user
    @user = User.find(params[:id])
  end

  def user_params(*args)
    params.require(:user).permit(*args)
  end

  def logged_in?
    !!session[:user_id]
  end

end
