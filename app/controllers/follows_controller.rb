class FollowsController < ApplicationController
  before_action :set_user, only: [:create]
  def create
    current_user.follows.create(followed_id: params[:user_id])
    current_user.events.where(action: "followed", eventable: @user).first_or_create
    respond_to do |format|
      format.html { redirect_to root_path  }
      format.js { render "follows/create"}
    end
  end

  def destroy
    @user_id = params[:id]
    current_user.follows.where('followed_id = ?', params[:id]).delete_all
    respond_to do |format|
      format.html { redirect_to root_path  }
      # byebug
      format.js { render "follows/destroy"}
    end
  end

  private

  def set_user
    @user_id = params[:user_id]
    @user = User.find(params[:user_id])
  end

end
