class Films::LikesController < LikesController
  before_action :set_likeable

  private
  def set_likeable
    @likeable = Film.find(params[:film_id])
  end
end