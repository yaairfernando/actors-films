class FilmsController < ApplicationController
  before_action :find_film, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!
  def index
    @films = Film.all.order('created_at DESC')
  end

  def new
    @film = Film.new
  end

  def create
    @film = current_user.films.build(film_params)
    if @film.save
      upload_image(params[:film][:image], @film)
      flash[:notice] = "New film added!!"
      redirect_to films_path
    else
      render :new
    end
  end

  def show 
  end

  def edit
  end

  def update
    if @film.update(film_params)
      update_image(params[:film][:image], @film)
      flash[:notice] = "Film updated!!"
      redirect_to films_path
    else
      render :edit
    end
  end

  def destroy
    destroy_image(@film.public_id)
    @film.destroy
    redirect_to films_path
  end

  private

  def film_params
    params.require(:film).permit(:image, :title)
  end

  def find_film
    @film = Film.find(params[:id])
  end
end
