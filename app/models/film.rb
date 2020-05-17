class Film < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
end
