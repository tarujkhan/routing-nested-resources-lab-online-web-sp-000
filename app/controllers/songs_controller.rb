require 'pry'
class SongsController < ApplicationController
  def index
    #pry
    if Artist.find_by(params[:id])
    flash[:notice] = "Artist not found"
    redirect_to artist_path(@artist)
  else
    @songs = Song.all
  end
end

  def show

    if Artist.Song.find(params[:format])
      flash[:notice] = "Song not found"
      redirect_to 'songs#index'
    else
      @song = Song.find(params[:format])
  end
end
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end
