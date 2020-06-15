class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  def mentions
    @mentions ||= begin
      regex = /@([\w]+)/
      body.scan(regex).flatten
    end
  end

  def mentioned_users
    @mentioned_users ||= User.where(name: @mentions)
  end
end
