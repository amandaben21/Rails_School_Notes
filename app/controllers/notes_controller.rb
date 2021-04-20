class NotesController < ApplicationController
    
    before_action :redirect_if_not_logged_in
    before_action :set_note, only: [:show, :edit, :update]
    
    def index
        @notes = current_user.notes
    end

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @note = @user.notes.build
            
        else 
            @note = Note.new
            @note.build_subject
        end
    end

    def create
        @note = current_user.notes.build(note_params)
        
        if @note.save
            redirect_to note_path(@note)
        else
            @note.build_subject
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

    def destroy
       Note.find(params[:id]).destroy
       redirect_to notes_path
    end

    private
    
    def note_params
        params.require(:note).permit(:lesson_name, :date, :note_entry, :subject_id, subject_attributes: [:name])
    end

    def set_note
        if Note.find_by_id(params[:id])
            @note = Note.find_by_id(params[:id])
            @comments = @note.comments
        else
            redirect_to notes_path if !@note
        end
    end

end
