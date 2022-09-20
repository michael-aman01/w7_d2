class UsersController < ApplicationController
   before_action :require_logged_in, only: [:show]
   before_action :require_logged_out, only: [:new, :create]
    def show
        if logged_in?
            @user = User.find_by(id: params[:id])
            render :show
        else
            redirect_to new_session_url
        end
    end

    def new
        @user = User.new
        render :new
    end 

    def create
        @user = User.new(user_params)
        if @user && @user.save
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
