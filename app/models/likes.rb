class Like < ActiveRecord::Base
  validates :user_id, uniqueness: {scope: :drink}
  belongs_to :drink
  belongs_to :user
end