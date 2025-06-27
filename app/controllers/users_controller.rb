class UsersController < ApplicationController
    def index
    end 

    def show
    end

    def create 
        @user = User.new(user_name: params[:user][:user_name],user_mail: params[:user][:user_mail] , user_password: params[:user][:user_password])
        if @user.save
            redirect_to("/sginup")
        else
            render :user_error , status: :unprocessable_entity
        end 
    end

    def update 
    end 

    def new
        @user = User.new
    end

    def destroy 
    end 
end
