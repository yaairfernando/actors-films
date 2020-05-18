class HomeController < ApplicationController
  def index
    @users = User.where.not('id = ?', current_user.id)
    @events = Event.where(user_id: [current_user.id, current_user.followers.pluck(:follower_id)].flatten)
  end
end
