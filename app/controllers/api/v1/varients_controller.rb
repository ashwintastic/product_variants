module Api
  module V1
    class VarientsController < ApplicationController

      def show
        varients = Varient.all
        render json: { message: varients}
      end
    end
  end
end

