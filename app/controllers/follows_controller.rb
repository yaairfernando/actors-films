class FollowsController < ApplicationController
  def create
    @user_id = params[:user_id]
    current_user.follows.create(followed_id: params[:user_id])
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

end
