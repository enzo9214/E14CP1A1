class ProductsController < ApplicationController
	
	def create
		@product = Product.new(product_params)
		@product.category = Category.find(params[:category_id])
		@product.save!
		redirect_to @product.category
	end

	def show
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to category_path(params[:category_id])
	end	

	private
		def product_params
			params.require(:product).permit(:name,:price)
		end	
end
