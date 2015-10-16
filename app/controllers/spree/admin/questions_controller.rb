module Spree
  module Admin
    class QuestionsController < ResourceController
      belongs_to 'spree/product', find_by: :slug

      def create
        question = @product.questions.new(allowed_params)
        question.user = spree_current_user
        if question.save
          flash[:notice] = t('question.sent')
          redirect_to admin_product_questions_path(@product)
        else
          flash[:error] = question.errors.full_messages.to_sentence
          redirect_to admin_product_questions_path(@product)
        end
      end

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
