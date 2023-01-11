class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  before_save :store_data

  def store_data
    user=User.pluck(:first_name).last
    self.author=user
  end 
end
