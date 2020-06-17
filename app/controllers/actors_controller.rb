class ActorsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_actor, only: [:show, :edit, :destroy, :bookmark, :update]

  def index
    @actors = Actor.all.order('created_at DESC')
  end

  def new
    @actor = Actor.new
  end

  def create
    byebug
    @actor = current_user.actors.build(actor_params)

    if @actor.save
      upload_image(params[:actor][:image], @actor)
      flash[:notice] = "Actor added!!"
      redirect_to actors_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
  end

  def update
    if @actor.update(actor_params)
      update_image(params[:actor][:image], @actor) if !params[:actor][:image].nil?
      flash[:notice] = "Actor updated"
      redirect_to actors_path
    else
      render :edit
    end
  end

  def destroy
    destroy_image(@actor.public_id)
    @actor.destroy
    redirect_to actors_path
  end

  def bookmark
    current_user.events.create(action: "bookmarked", eventable: @actor)
    redirect_to actors_path
  end


  private

  def actor_params
    params.require(:actor).permit(:image, :name, :published_at, :status)
  end

  def find_actor
    @actor = Actor.find(params[:id])
  end
end
