class Actor < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
end
