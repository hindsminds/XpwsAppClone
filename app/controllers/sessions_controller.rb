class SessionsController < ApplicationController
    def new
      # redirect_to home_index_path unless session[:user_id].nil? && cookies.permanent.signed[:user_id].nil?
    end
  
    def create
      @user = User.find_by(email: params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
        if params[:session][:remember_me] == "1" 
          cookies.permanent.signed[:user_id] = @user.id
        end
        
        session[:user_id] = @user.id

        flash[:notice] = "Login successful"
        redirect_to home_index_path
      else
        redirect_to new_session_path, notice: "Invalid Email or Password"
      end
    end
    
    
    
  
    def destroy
      session.delete(:user_id)
      cookies.delete(:user_id)
      redirect_to new_session_path, notice: 'Logged out successfully!'
    end
  end
  
  