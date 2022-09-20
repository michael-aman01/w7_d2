class ApplicationController < ActionController::Base
   before_action :add_shared_views
    helper_method :current_user, :require_logged_in, :require_logged_out, :login, :logout, :logged_in?
    
    def add_shared_views
        prepend_view_path 'app/views/shared'
    end
    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login!(user)
        user.reset_session_token!
        session[:session_token] = user.session_token
        
    end

    def logout!
        @current_user = current_user
        @current_user.reset_session_token!
        session[:session_token] = nil
        
        @current_user = nil
    end

    def logged_in?
        !!current_user
    end

    def require_logged_out
        if logged_in?
            redirect_to user_url(current_user)
        end
    end

    def require_logged_in
        if !logged_in?
            redirect_to new_session_url
        end
    end

end
