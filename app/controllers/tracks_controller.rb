class TracksController < ApplicationController
  before_action do
    unless logged_in?
      flash[:errors] = ["Please log in first"]
      redirect_to new_session_url
    end
  end

  def show
    @track = Track.find(params[:id])
    @note = Note.new
    render :show
  end

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    @track.album = Album.find(params[:track][:album_id])

    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end


  def edit
    @track = Track.find(params[:id])
    render :edit
  end


  def update
    @track = Track.find(params[:id])

    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy!
    redirect_to album_url(@track.album)
  end

private
  def track_params
    params.require(:track).permit(:name, :lyrics)

  end
end
