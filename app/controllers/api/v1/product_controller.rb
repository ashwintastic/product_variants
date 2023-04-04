module Api
 module V1
   class ProductController < ApplicationController

     before_action :product_parameter, only: [:create]


     def index
       products = Product.all
       resp = products.reduce({}) do |acc, e|
         acc[e.id] = e.name
         acc
       end
       render json:  { products: resp }
     end

     def create_product_varient
       product_id = product_parameter[:product_id]
       varient_id = product_parameter[:varient_id]
     end

     # TODO:: apply strong parameters
     def fetch_product_and_its_varients
       ProductVarient.get_product_and_its_varients(params[:product_id])
     end


     def create
       begin
         resp = Product.create({name: product_parameter[:name]})
         render json: {satus: 200, message: 'Product Created', id: resp.id}
       rescue =>  err
         err_msg = err.backtrace.join('\n')
         puts "Some error occurred #{err_msg}"
         render json: {satus: 500, message: err_msg }
       end
     end

     private

     def product_parameter
       debugger
       params.require(:product).permit(:name, :product_id)
     end
   end
end
end

