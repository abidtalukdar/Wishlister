class LoginController < ApplicationController

    skip_before_action :authenticate!

    def new
        @errors = flash[:errors]
    end

    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to wishlists_path
        else
            flash[:errors] = ["The username or password does not match."]
            redirect_to new_login_path
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notification] = "You have logged out."
        redirect_to new_login_path
    end

end