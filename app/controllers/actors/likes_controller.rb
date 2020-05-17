class Actors::LikesController < ApplicationController
  before_action :set_likeable
  before_action :authenticate_user!

  include ActorsHelper

  def create
    @likeable.likes.where(user_id: current_user.id).first_or_create
    send_notification @likeable
    respond_to do |format|
      format.html { redirect_to @likeable }
      format.js { render "likes/create"}
    end
  end

  def destroy
    @likeable.likes.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html { redirect_to @likeable }
      format.js { render "likes/destroy"}
    end
  end

  private
  def set_likeable
    @likeable = Actor.find(params[:actor_id])
  end
end