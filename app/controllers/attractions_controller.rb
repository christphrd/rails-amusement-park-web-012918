class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
    # @user = User.new
  end

  def create
    # @user = User.new(user_params(:name, :password, :nausea, :happiness, :tickets, :height, :admin))
    # if @user.save
    #   session[:user_id] = @user.id
    #   redirect_to user_path(@user)
    # else
    #   redirect_to new_user_path
    # end
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
    
    # if logged_in?
    #   render :show
    # else
    #   redirect_to home_path
    # end
  end

  def edit

  end

  def update

  end

  def destroy

  end
end
