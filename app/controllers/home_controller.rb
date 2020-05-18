class HomeController < ApplicationController
  def index
    @users = User.where.not('id = ?', current_user.id)
    @events = Event.all
  end
end
