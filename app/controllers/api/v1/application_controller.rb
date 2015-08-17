module API
	module V1
		class ApplicationController < ActionController::Base
		  # Prevent CSRF attacks by raising an exception.
		  # For APIs, you may want to use :null_session instead.

	      def current_user
	        user_token = params[:auth_token] ||  request.headers["HTTP_X_AUTH_TOKEN"]  # params[:auth_token] just for test
	        user = user_token && User.find_by_authentication_token(user_token)
	        if !user || user.token != user_token
	          return nil
	        end
	        user
	      end
		end
	end
end
