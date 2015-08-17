module API
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: [:show, :update, :destroy]

      # GET /products
      # GET /products.json
      def index
        @products = Product.all
        exceptFields = [:picture, :register_date, :created_at, :updated_at]
        return render json: { products: @products.as_json(:except => exceptFields) }, status: 200
      end

      # GET /products/1
      # GET /products/1.json
      def show
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
        if product.save
          return render json: { created: true }, status: 200
        end
        return render json:{ error: product.errors }, status: 422
      end

      # PATCH/PUT /products/1
      # PATCH/PUT /products/1.json
      def update
        respond_to do |format|
          if @product.update(product_params)
            format.html { redirect_to @product, notice: 'Product was successfully updated.' }
            format.json { render :show, status: :ok, location: @product }
          else
            format.html { render :edit }
            format.json { render json: @product.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /products/1
      # DELETE /products/1.json
      def destroy
        @product.destroy
        respond_to do |format|
          format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_product
          @product = Product.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def product_params
          params.require(:product).permit(:product_name, :description, :picture, :status, :register_date)
        end
    end
  end
end
