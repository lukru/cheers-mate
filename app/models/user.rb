class User < ActiveRecord::Base
  has_many :drinks
  has_many :likes
end
