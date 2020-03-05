class ApplicationController < ActionController::Base

    before_action :set_up_auth_stuff
    before_action :authenticate!

    private

        def set_up_auth_stuff
            @logged_in_user_id = session[:user_id]
            @successful_log_in = !!@logged_in_user_id

            @notification = flash[:notification]
            @errors = flash[:errors]

            if @successful_log_in
                @logged_in_user = User.find(@logged_in_user_id)
            end
        end

        def authenticate!
            unless @successful_log_in
              flash[:errors] = [ "You must log in to do that" ]
              redirect_to new_login_path
            end
        end

        def authorized?(user_id)
            user_id == @logged_in_user_id
        end

end
