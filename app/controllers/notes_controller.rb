class NotesController < ApplicationController
  before_action(only: :destroy) do
    @note = Note.find(params[:id])
    unless @note.user == current_user
      render text: "Status 404 - Forbidden", status: :forbidden
    end
  end

  def create
    @note = current_user.notes.new(note_params)
    @note.track_id = params[:track_id]

    current_user.save
    redirect_to track_url(@note.track)
  end

  def update
    render json: "Updating"
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy!
    redirect_to track_url(@note.track)
  end

  private
  def note_params
    params.require(:note).permit(:text)
  end
end
