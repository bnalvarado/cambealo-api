module API
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: [:show, :update, :destroy]
      before_action :set_user, only: [:index, :create, :show, :update, :destroy]
      # GET /products
      # GET /products.json
      def index
        products = @user.products.all
        exceptFields = [:register_date, :created_at, :updated_at]
        return render json: { products: products.as_json(:except => exceptFields) }, status: 200
      end

      def all
        @products = Product.all
        exceptFields = [:register_date, :created_at, :updated_at]
        return render json: { products: @products.as_json(:except => exceptFields) }, status: 200
      end

      # GET /products/1
      # GET /products/1.json
      def show
        if @product.nil?
          return render json: { error: @product.errors }, status: 422
        end
        return render json: { product: @product }, status: 200
      end

      # GET /products/new
      def new
        @product = Product.new
      end

      # GET /products/1/edit
      def edit
      end

      # POST /products
      # POST /products.json
      def create
        product = Product.new(product_params)
        if !product.save
          return render json:{ error: product.errors }, status: 422
        end
        @user.products.push(product)
        return render json: { created: true }, status: 200
      end

      # PATCH/PUT /products/1
      # PATCH/PUT /products/1.json
      def update
        product = @user.products.find(params[:id])
          if !product.update(product_update_params)
            return render json: { error: @product.errors }, status: 422
          else
            return render json: { updated: true }, status: 200
          end
      end

      # DELETE /products/1
      # DELETE /products/1.json
      def destroy
        product = @user.products.find(params[:id])
        if !product.destroy
          return render json: { error: @product.errors }, status: 422
        else
          return render json: { deleted: true }, status: 200
        end
      end

      def search
        product = Product.search(params[:name])
        if product.nil?
          return render json: { error: product.errors }, status: 422
        end
        return render json: { product: product }, status: 200
      end

      private

        def set_user
          @user = User.find(params[:user_id])
        end

        # Use callbacks to share common setup or constraints between actions.
        def set_product
          @product = Product.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def product_params
          params.require(:product).permit(:product_name, :description, :picture, :status, :register_date)
        end

        def product_update_params
          params.require(:product).permit(:product_name, :description, :picture, :status)
        end
    end
  end
end
