class UsersController < ApplicationController
    def index
    end 

    def show
        @user = User.find(params[:id])
    end

    def create 
        @user = User.new(user_name: params[:user][:user_name],user_mail: params[:user][:user_mail] , user_password: params[:user][:user_password])
        if @user.save
            puts users_url(@user)
            redirect_to "/users/#{@user.id}"
        else
            render :user_error , status: :unprocessable_entity
        end 
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_name: params[:user][:user_name],user_mail: params[:user][:user_mail],user_password: params[:user][:user_password]) 
            redirect_to "/users/#{@user.id}"
        else
            render :user_error , status: :unprocessable_entity
        end
    end 

    def new
        @user = User.new
    end

    def destroy 
    end 
end
