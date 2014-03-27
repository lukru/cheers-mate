class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :drinks
  has_many :likes

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  scope :search, ->(query){ where("username ilike ?", "%#{query}%") }

  def friends_drinks
    Drink.where(user_id: friends)
  end
      
  def friend_of?(user)
    # Return false if you're me
    return false if user.id == self.id
    # Return true if you're one of my friends
    return true if friends.include?(user)

    return false 
  end

end
