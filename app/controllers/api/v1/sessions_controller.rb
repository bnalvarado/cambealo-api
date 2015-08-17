module API
	module V1
		class SessionsController < ApplicationController
			#Before create sessions authenticate user from token

			#Create sessions
			def create
		        user = User.authenticate(params[:email], params[:password])
		      	if user.nil?
		      	  return render json: { response: 'Invalid data' }, status: 401
		      	end
		        exceptFields = [:password, :created_at, :updated_at]
		        return render json: { user: user.as_json(:except => exceptFields) }, status: 200
	      	end
		end
	end
end
