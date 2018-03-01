class RidesController < ApplicationController
  def new

  end

  def create
    @user = User.find(params[:user_id])
    @attraction = Attraction.find(params[:attraction_id])
    @ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])
    @ride.take_ride

    redirect_to user_path(@user)
  end
end
