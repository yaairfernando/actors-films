class Event < ApplicationRecord
  belongs_to :user
  belongs_to :eventable, polymorphic: true
  # belongs_to :follower, class_name: "User"
end
