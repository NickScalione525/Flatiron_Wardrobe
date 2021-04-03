class SessionsController < ApplicationController


    def destroy
        session.clear
        redirect_to root_path
    end
    
    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        elsif @user
            @errors = ["Invalid Password, Please Try Again."]
            render :new
        else
            @errors = ["Invalide Username, Please Try Again"]
            render :new
    end
    
    
    
    end