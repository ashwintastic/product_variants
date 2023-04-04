class ProductVarient < ApplicationRecord
  belongs_to :product
  belongs_to :varient

  attr_accessor :name

  has_many :product_varient_options, foreign_key: :product_varient_id

  validates :product_id, uniqueness: { scope: :varient_id}

  after_initialize do |_|
    @name = 'Product Varients Demo'
  end


  class << self

    def create_product_varient(product_id, varient_id)
      begin
        product = Product.find_by(id: product_id)
        varient = Varient.find_by(id: varient_id)
        resp = ProductVarient.create!(product_id: product.id, varient_id: varient.id)
        return resp
      rescue => err
        err_details = err.backtrace.join('\n')
        puts "Some error occured #{err_details}"
        return {status: 500 , message: err.message }
      end
    end



    def get_product_and_its_varients(product_id)
      query = <<~QUERY
        select p.name, p.id, pvs.product_id, pvs.varient_id, pvs.id, v.name from product_varients pvs inner join products p
         on p.id = product_varients.product_id inner join 
         varients v on v.id = product_varients.varient_id where p.id  = ?
      QUERY
      debugger
      records = execute_sql(query, product_id)

    end
  end
end

#ssh-keygen -t ed25519 -C "ashwinidx@gmail.com"