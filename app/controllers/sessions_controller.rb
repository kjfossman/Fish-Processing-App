class SessionsController < ApplicationController

    def new
        
    end

    def create
        
        @user = User.find_by_username(params[:user][:username])

        if @user && @user.password_verified(params[:user][:password])
            flash[:message] = "Welcome Back #{@user.username}!"
            session[:user_id] = @user.id
            redirect_to root_path
        else
            if !@user
                flash[:message] = "Username does not exist"
            else
            flash[:message] = @user.errors.full_messages.to_sentence
            end
            render :new
        end
    end

    def delete
        session.clear
        redirect_to login_path
    end

    def omniauth
        @user = User.find_or_create_by(username: auth[:info][:email]) do |u|
            u.password = SecureRandom.hex(20)
        end
        if @user.valid?
            flash[:message] = "Signed in with Google"
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:error] = "Invalid Signin"
            redirect_to login_path
        end
    end

    private
    def auth 
        request.env['omniauth.auth']
    end
end
