module Spree
  module Admin
    class QuestionsController < ResourceController
      belongs_to 'spree/product', find_by: :slug
      before_filter :load_question, only: [:delete_answer]

      def index
        @collection = @collection.page params[:page]
      end

      def pending
        @collection = Spree::Question.not_answered.joins(:product).map(&:product)
      end

      def delete_answer
        if @question.answer.destroy
          redirect_to admin_product_questions_path(@product)
        else
          render json: review.errors.messages.values.flatten.to_json, status: 422
        end
      end

      private

      def load_data
        @product = Spree::Product.find(allowed_params[:product_id])
      end

      def allowed_params
        params.require(:question).permit(:content, :product_id, :id)
      end

      def load_question
        @question = Spree::Question.find(params[:id])
      end

    end
  end
end
