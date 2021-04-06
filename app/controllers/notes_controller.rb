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
    end

    def edit
        #restrict access to current_user
    end

    def update
    end

    def destory
        #restrict access to current_user
    end

end
