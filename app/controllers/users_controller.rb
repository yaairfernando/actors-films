class UsersController < ApplicationController
  before_action :set_user, only: [:follow]
  def follow
    current_user.events.create(action: "followed", eventable: @user)
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end