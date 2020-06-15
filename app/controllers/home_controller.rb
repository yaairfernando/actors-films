class HomeController < ApplicationController
  def index
    if user_signed_in?
      @users = User.where.not('id = ?', current_user.id)
      @events = Event.where(user_id: [current_user.id, current_user.followers.pluck(:follower_id)].flatten)
    else 
      @events = Event.all
      @users = User.all
    end
  end
end
