class ApplicationController < ActionController::Base
    before_action :authenticate_user, except: [:new, :create]

    def authenticate_user 
        redirect_to new_session_path unless session[:user_id].present? || cookies[:user_id].present?
    end  
end
