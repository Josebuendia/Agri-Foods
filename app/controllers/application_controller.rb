class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery
    def is_farmer?
        if user_signed_in? && current_user.role == 1
            true
        else
          false
        end
    end
      helper_method :is_farmer?
end
