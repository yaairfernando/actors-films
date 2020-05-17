class Actors::LikesController < LikesController
  before_action :set_likeable

  private
  def set_likeable
    puts "--------------------------------------"
    puts "ENTER TO ACTOR SET LIKEABLE"
    puts "--------------------------------------"
    # byebug
    @likeable = Actor.find(params[:actor_id])
  end
end