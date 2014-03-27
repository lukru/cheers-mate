class Drink < ActiveRecord::Base
  belongs_to :user
  has_many :likes

  mount_uploader :image, ImageUploader


  scope :search, ->(query){ 
    search_str = "%#{query}%"
    where("name ilike ? OR description ilike ?", search_str, search_str) 
  }
end
