class User < ApplicationRecord
  before_save :downcase
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :films, foreign_key: "creator_id"
  has_many :actors, foreign_key: "creator_id"
  has_many :comments
  has_many :likes
  has_many :notifications, as: :recipient
  has_many :events
  has_many :recieved_follows, foreign_key: "followed_id", class_name: "Follow"
  has_many :followers, through: :recieved_follows, source: :follower
  
  def downcase
    email.downcase!
  end

  def likes?(likeable)
    likeable.likes.where(user_id: id).any?
  end
end
