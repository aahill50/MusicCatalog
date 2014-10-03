class AlbumsController < ApplicationController
  before_action do
    unless logged_in?
      flash[:errors] = ["Please log in first"]
      redirect_to new_session_url
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @album = Album.new(band_id: params[:band_id])
    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to band_url(@album.band)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end


  def edit
    @album = Album.find(params[:id])
    render :edit
  end


  def update
    @album = Album.find(params[:id])
    @album.band_id = params[:band_id]
    @album.recording_style = params[:album][:recording_style]

    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.error.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy!
    redirect_to band_url(@album.band)
  end

  private
  def album_params
    params.require(:album).permit(:name, :band_id, :recording_style)
  end
end
