class Product < ApplicationRecord
  has_many :product_varients
  has_many :varients, through: :product_varients
  has_many :product_varient_options
  has_one :price

  class << self

    def with_varients

    end
  end
end



