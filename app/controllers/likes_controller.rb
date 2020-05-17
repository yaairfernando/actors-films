class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    puts "LIKEABLE #{@likeable.inspect}"
    puts "LIKEABLE: #{@likeable.is_a?(Film)}"
    @likeable.likes.where(user_id: current_user.id).first_or_create
    create_notification @likeable
    # byebug
    respond_to do |format|
      format.html { redirect_to @likeable }
      format.js
    end
  end

  def destroy
    @likeable = nil
    if params[:module] == :actors
      puts "------------------------------"
      puts "IT IS AN ACTOR"
      puts "------------------------------"
      @likeable = Actor.find(params[:like][:likeable])
    else
      puts "------------------------------"
      puts "IT IS A FILM"
      puts "------------------------------"
      @likeable = Film.find(params[:like][:likeable])
    end
    # byebug
    @likeable.likes.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html { redirect_to @likeable }
      format.js
    end
  end

end