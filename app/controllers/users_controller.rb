class UsersController < ApplicationController
    def index
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_name: params[:user][:name], user_mail: params[:user][:mail], password: params[:user][:password_digest],  password_confirmation: params[:user][:password_digest])
        if @user.save
            redirect_to "/users/#{@user.id}"
        else
            render :user_error, status: :unprocessable_entity
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_name: params[:user][:user_name], user_mail: params[:user][:user_mail], password: params[:user][:password_digest], password_confirmation: params[:user][:password_digest])
            redirect_to "/users/#{@user.id}"
        else
            render :user_error, status: :unprocessable_entity
        end
    end

    def new
        @user = User.new  # これ消すな！　form_with に mode: @user 指定するために必要！
    end

    def login
    end

    def validate
        # email から DB のオブジェクト取得
        # password のハッシュ化と，オブジェクトのパスワード比較して認証
        @user = User.find_by(user_mail: params[:user_mail])
        if @user && @user.authenticate(params[:password])
            redirect_to user_path(@user)
        else
            redirect_to login_path
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to login_path
    end
end
