module Spree
  module Admin
    class QuestionsController < ResourceController
      belongs_to 'spree/product', find_by: :slug
      
      def index
        @collection = @collection.page params[:page]
      end

      def pending
        @collection = Spree::Question.not_answered.joins(:product).map(&:product)
      end

      private
      def load_data
        @product = Spree::Product.find(allowed_params[:product_id])
      end

      def allowed_params
        params.require(:question).permit(:content, :product_id)
      end


    end
  end
end
