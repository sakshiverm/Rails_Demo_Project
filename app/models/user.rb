class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, through: :post
    validates :email,presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :password, uniqueness: true, presence: true, length: { minimum: 7 }
end
