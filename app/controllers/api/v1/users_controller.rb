module API
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [:show, :update, :destroy]

      # GET /users
      # GET /users.json
      def index
        @users = User.all
      end

      # GET /users/1
      # GET /users/1.json
      def show
        if @user.nil?
          return render json: { error: @user.errors }, status: 422
        end
        exceptFields = [:password, :created_at, :updated_at]
        return render json: { user: @user.as_json(:except => exceptFields) }, status: 200
      end

      # GET /users/new
      def new
        @user = User.new
      end

      # GET /users/1/edit
      def edit
      end

      # POST /users
      # POST /users.json
      def create
        user = User.new(user_params)
        if user.save
          return render json: { created: true }, status: 200
        end
        return render json:{ error: user.errors }, status: 422
      end

      # PATCH/PUT /users/1
      # PATCH/PUT /users/1.json
      def update
        if !@user.update(user_update_params)
          return render json: { error: @user.errors }, status: 422
        else
          exceptFields = [:password, :created_at, :updated_at]
          return render json: { updated: true, user: @user.as_json(:except => exceptFields) }, status: 200
        end
      end

      # DELETE /users/1
      # DELETE /users/1.json
      def destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def user_params
          params.require(:user).permit(:first_name, :last_name, :password, :email, :phone, :age)
        end

        def user_update_params
          params.require(:user).permit(:first_name, :last_name, :email, :phone, :age)
        end
    end
  end
end
