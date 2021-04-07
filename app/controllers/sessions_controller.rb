class SessionsController < ApplicationController

    def new
        #login form
        @user = User.new
    end

    def create
        #logging in
        @user = User.find_by_username(params[:user][:username])
        
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to notes_path
        else
            render :new
        end
    end

    def destroy
        #logging out
        session.clear
        redirect_to "/"
    end
end
