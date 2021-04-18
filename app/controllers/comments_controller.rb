class CommentsController < ApplicationController
    
    before_action :redirect_if_not_logged_in
    before_action :set_comment, only: [:edit, :update, :show]

    def index
        if params[:note_id] && @note = Note.find_by_id(params[:note_id])
            @comments = @note.comments
        else
            @errors = "Note does not exist" if params[:note_id]
            @comment = Comment.all
        end
    end

    def new
        if params[:note_id] && @note = Note.find_by_id(params[:note_id])
            @comment = @note.comments.build
        else
            @comment = Comment.new
        end
    end

    def create
        @comment = current_user.comments.bulid(comment_params)
        if @comment.save
            redirect_to comments_path
        else
            render :new
        end
    end


    def show
        redirect_to note_comment_path if !@comment
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
        Comment.find_by_id(params[:id]).destroy
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
