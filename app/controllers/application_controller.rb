class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    private
        def is_login?
            return session[:logged_in] == true
        end
        def must_be_logged_in
            if is_login?
                return true
            else
                redirect_to login_path, notice: 'you must be login before accessing this page'
            end 
        end

        def role?
            u = User.where(id: session[:id]).first   
            if u.user_type == 0
                return 'admin'
            elsif u.user_type == 1
                return 'seller'
            elsif u.user_type == 2
                return 'buyer'
            else
                return 'guest'
            end        
        end
        

end
