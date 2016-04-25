class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def create
    @note = Note.create(note_params)
    redirect_to '/notes'
  end

  def note_params
    date_today = Date.today
    params.require(:note).permit(:title,
                                 :priority,
                                 :contents)
                         .merge( :date_created => date_today,
                                 :date_last_viewed => date_today)
  end
end
