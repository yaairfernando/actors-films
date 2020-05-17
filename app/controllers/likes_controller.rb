# class LikesController < ApplicationController
#   before_action :authenticate_user!
#   def destroy
#     @likeable = nil
#     if params[:module] == :actors
#       puts "------------------------------"
#       puts "IT IS AN ACTOR"
#       puts "------------------------------"
#       @likeable = Actor.find(params[:like][:likeable])
#     else
#       puts "------------------------------"
#       puts "IT IS A FILM"
#       puts "------------------------------"
#       @likeable = Film.find(params[:like][:likeable])
#     end
#     # byebug
#     @likeable.likes.where(user_id: current_user.id).destroy_all

#     respond_to do |format|
#       format.html { redirect_to @likeable }
#       format.js
#     end
#   end

# end