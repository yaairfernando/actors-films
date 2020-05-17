class Actors::LikesController < LikesController
  before_action :set_likeable

  private

  def set_likeable
    @likeable = Actor.find(params[:actor_id])
  end
end