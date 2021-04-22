class SessionsController < ApplicationController

    def new
        
    end

    def create
        
        @user = User.find_by_username(params[:user][:username])

        if @user && @user.password_verified(params[:user][:password])
            flash[:message] = "Welcome"
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
        binding.pry
    end
end
