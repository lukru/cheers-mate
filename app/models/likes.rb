class Likes < ActiveRecord::Base
  validates :user_id, uniqueness: {scope: :like}
  belongs_to :drink
  belongs_to :user
end
