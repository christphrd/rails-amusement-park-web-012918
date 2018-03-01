class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :attraction
  belongs_to :user

  validate :enough_height
  validate :enough_tickets

  def take_ride
    @user.update(tickets: (@user.tickets - @attraction.tickets))
    @user.update(happiness: (@user.happiness + @attraction.happiness_rating))
    @user.update(nausea: (@user.nausea + @attraction.nausea_rating))
  end

  def enough_height
    get_user
    get_attraction
    if @user.height <= @attraction.min_height
      self.errors.add(:ride, "sorry you are not tall enough!")
    end
  end

  def enough_tickets
    get_user
    get_attraction
    if @user.tickets <= @attraction.tickets
      self.errors.add(:ride, "sorry you don't have enough tickets!")
    end
  end

  private

  def get_attraction
    @attraction = Attraction.find(self.attraction_id)
  end

  def get_user
    @user = User.find(self.user_id)
  end
end
