class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @likeable.likes.where(user_id: current_user.id).first_or_create
    
    respond_to do |format|
      format.html { redirect_to @likeable }
      format.js
    end
  end

  def destroy
    @likeable = Film.find(params[:like][:likeable])
    @likeable.likes.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html { redirect_to @likeable }
      format.js
    end
  end

end