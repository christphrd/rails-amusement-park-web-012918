class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides
  validates :password, presence: true

  def mood
    if self.happiness > self.nausea
      "happy"
    else
      "sad"
    end
  end
end
