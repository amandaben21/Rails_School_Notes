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
            flash[:message] ="That user doesn't exist, please try again or sign up" 
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

    def omniauth
        @user = User.find_by_omniauth(auth)
        if @user
            session[:user_id] = @user.id
            redirect_to notes_path
        else
            redirect_to login_path
        end
    end

    private
    def auth
        request.env['omniauth.auth']
    end
end
