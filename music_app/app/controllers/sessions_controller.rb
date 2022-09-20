class SessionsController < ApplicationController
     before_action :require_logged_in, only: [:destroy]
     before_action :require_logged_out, only: [:create, :new]

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user && @user.save
            login!(@user)
            redirect_to user_url(@user.id)
        else
            render :new
        end
    end



    def new
        @user = User.new
        render :new
    end

    def destroy
        logout!
        redirect_to new_session_url
    end

end
