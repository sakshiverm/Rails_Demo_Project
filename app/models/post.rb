class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many_attached :images
  before_save :store_data
  def store_data
    user=User.pluck(:first_name).last
    self.author_user=user
    self.published=true
  end 
end
