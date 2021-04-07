class NotesController < ApplicationController

    def index
        #who this should be accessible by?
        @notes = current_user.notes
    end

    def show
        #see the notes they created
        @note = Note.find_by_id(params[:id])
    end

    def new
    end

    def create
        @note = Note.new(note_params)
        if @note.save
            redirect_to note_path
        else
            render :new
        end
    end

    def edit
        #restrict access to current_user
    end

    def update
    end

    def destory
        #restrict access to current_user
    end

    private
    
    def note_params
        params.require(:note).permit(:lesson_name)
    end

end
