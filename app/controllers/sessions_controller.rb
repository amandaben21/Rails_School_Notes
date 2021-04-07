class SessionsController < ApplicationController

    def new
        #login form
        @user = User.new
    end

    def create
        #logging in
        @user = User.find_by_username(params[:username])
        
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to note_path(@user)
        else
            render :new
        end
    end

    def home
    end

    def destroy
        #logging out
        session.clear
        redirect_to root_path
    end
end
