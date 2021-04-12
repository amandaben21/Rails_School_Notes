class NotesController < ApplicationController
    
    before_action :redirect_if_not_logged_in
    before_action :set_note, only: [:show, :edit, :update]
    
    def index
        @notes = current_user.notes
    end

    def new
        @note = Note.new
        @note.build_subject
    end

    def create
        @note = current_user.notes.build(note_params)
        
        if @note.save
            redirect_to user_path(@note)
        else
            render :new
        end
    end

    def show
    end

    def edit
        
    end

    def update
        @note.update(note_params)
        
        if @note.save
            redirect_to note_path(@note)
        else 
            render :edit
        end
    end

    def destory
        if @note
            @note.destory
            redirect_to note_path
        else
            redirect_to note_path(@notes)
        end
    end

    private
    
    def note_params
        params.require(:note).permit(:lesson_name, :date, :note_entry, :subject_id, subject_attributes: [:name])
    end

    def set_note
        @note = current_user.notes.find_by_id(params[:id])
    end

end
