class CommentsController < ApplicationController
    
    before_action :redirect_if_not_logged_in
    before_action :set_comment, only: [:show, :edit, :update]

    def index
        if params[:note_id] && @user = User.find_by_id(params[:note_id])
            @comments = @notes.comments
        else
           
            @comments = Comment.all
        end
    end

    def new
       
        if params[:note_id] && @note = Note.find_by_id(params[:note_id])  
            if @note.user != current_user 
                @comment = @note.comments.build
            else 
                redirect_to comments_path
            end
        else
            redirect_to notes_path
        end
    end

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to comments_path
        else
            render :new
        end
    end


    def show
        redirect_to note_comments_path if !@comment
    end

    def update
        if @comment.update(comment_params)

            redirect_to note_comment_path(@comment)
        else
            render :edit
        end
    end

    def edit
    end

    def destroy
        Comment.find(params[:id]).destroy
        redirect_to comments_path
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :note_id)
    end

    def set_comment
        @comment = Comment.find_by_id(params[:id])
    end
end
