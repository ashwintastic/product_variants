module Api
  module V1

    class ProductsVarientsController < ApplicationController

      def create_product_varient
        product_id = pv_params[:product_id]
        varient_id = pv_params[:varient_id]
        resp = ProductVarient.create_product_varient(product_id, varient_id)

        render json: { message: resp}
      end



      private

        def product_varient_parameter
        params.require(:products_varient)
            .permit(:product_id, :varient_id)
      end

      alias_method :pv_params, :product_varient_parameter

    end
  end
end

