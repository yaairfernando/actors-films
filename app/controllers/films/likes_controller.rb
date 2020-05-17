class Films::LikesController < LikesController
  before_action :set_likeable

  private
  def set_likeable
    puts "--------------------------------------"
    puts "ENTER TO FILM SET LIKEABLE"
    puts "--------------------------------------"
    # byebug
    @likeable = Film.find(params[:film_id])
  end
end